import 'package:allenrealestateflutter/core/data_models/async_result.dart';
import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/core/ioc/locator.dart';
import 'package:allenrealestateflutter/core/repositories/real_estate_category_repository/real_estate_category_repository.dart';
import 'package:allenrealestateflutter/core/repositories/real_estate_repository/real_estate_repository.dart';
import 'package:allenrealestateflutter/core/view_models/base_view_model/base_view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  static const tag = 'HomeViewModel';
  static const _mainStateTag = 'main';
  RealEstateRepository _realEstateRepo = locator<RealEstateRepository>();
  RealEstateCategoryRepository _realEstateCategoryRepo = locator<RealEstateCategoryRepository>();

  ViewModelStatePiece<HomeData> get mainState => state[_mainStateTag];

  HomeViewModel() {
    this.createStatePiece<HomeData>(_mainStateTag, data: HomeData(popularReList: [], reCategoryList: []));
  }

  void init() {
    this.mapFutureResultToState<HomeData>(key: _mainStateTag, resultGenerator: _getHomeData);
  }

  Future<AsyncResult<HomeData>> _getHomeData() async {
    List<RealEstateListItem> popularReList;
    List<RealEstateCategory> categoryList;

    List<dynamic> results = await Future.wait([
      _realEstateRepo.getPopularRealEstates(),
      _realEstateCategoryRepo.getRealEstateCategories(),
    ]);

    try {
      popularReList = (results[0] as AsyncResult<List<RealEstateListItem>>).data;
      categoryList = (results[1] as AsyncResult<List<RealEstateCategory>>).data;
    } catch (error) {
      throw Exception('$tag - Could not get home data: $error');
    }

    return AsyncResult(
      data: HomeData(
        reCategoryList: categoryList,
        popularReList: popularReList,
      ),
    );
  }
}

class HomeData {
  final List<RealEstateListItem> popularReList;
  final List<RealEstateCategory> reCategoryList;

  HomeData({this.popularReList, this.reCategoryList});
}
