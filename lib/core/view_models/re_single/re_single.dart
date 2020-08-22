import 'package:allenrealestateflutter/core/data_models/async_result.dart';
import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/core/ioc/locator.dart';
import 'package:allenrealestateflutter/core/repositories/real_estate_repository/real_estate_repository.dart';
import 'package:allenrealestateflutter/core/services/real_estate_service/implementations/mock/mock_db.dart';
import 'package:allenrealestateflutter/core/view_models/base_view_model/base_view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReSingleViewModel extends BaseViewModel {
  static const tag = 'ReSingleViewModel';
  static const _mainStateTag = 'main';
  RealEstateRepository _realEstateRepo = locator<RealEstateRepository>();

  ViewModelStatePiece<RealEstateSingleData> get mainState => state[_mainStateTag];

  var mockReListJson = realEstateList.sublist(0, 6).toList();

  ReSingleViewModel() {
    this.createStatePiece<RealEstateSingleData>(_mainStateTag);
  }

  void getSingleData(String id) {
    mapFutureResultToState<RealEstateSingleData>(
        key: _mainStateTag,
        resultGenerator: () async {
          AsyncResult<List<RealEstateListItem>> asyncResultPopularReList;
          AsyncResult<RealEstate> asyncResultRealEstate;

          List<dynamic> results = await Future.wait([
            _realEstateRepo.getPopularRealEstates(),
            _realEstateRepo.getRealEstateById(id: id),
          ]);

          try {
            asyncResultPopularReList = results[0] as AsyncResult<List<RealEstateListItem>>;
            asyncResultRealEstate = results[1] as AsyncResult<RealEstate>;
          } catch (error) {
            throw Exception('$tag - Could not get single data: $error');
          }

          return AsyncResult(
            data: RealEstateSingleData(
              carouselData: asyncResultPopularReList.data,
              realEstate: asyncResultRealEstate.data,
            ),
          );
        });
  }
}

class RealEstateSingleData {
  final List<RealEstateListItem> carouselData;
  final RealEstate realEstate;

  RealEstateSingleData({this.carouselData, this.realEstate});
}
