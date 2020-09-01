import 'package:allenrealestateflutter/core/data_models/async_result.dart';
import 'package:allenrealestateflutter/core/data_models/pagination_data.dart';
import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/core/ioc/locator.dart';
import 'package:allenrealestateflutter/core/repositories/real_estate_repository/real_estate_repository.dart';
import 'package:allenrealestateflutter/core/view_models/base_view_model/base_view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReCategoryViewModel extends BaseViewModel {
  static const tag = 'ReCategoryViewModel';
  static const _mainStateTag = 'main';
  RealEstateRepository _realEstateRepo = locator<RealEstateRepository>();
  String id;

  ViewModelStatePiece<List<RealEstateListItem>> get mainState => state[_mainStateTag];

  ReCategoryViewModel() {
    createStatePiece(
      _mainStateTag,
      data: <RealEstateListItem>[],
      pagination: PaginationData(),
    );
  }

  void init() {
    this.mapFutureResultToState<List<RealEstateListItem>>(key: _mainStateTag, resultGenerator: () => _getSearchResults());
  }

  Future<AsyncResult<List<RealEstateListItem>>> _getSearchResults() async {
    AsyncResult<List<RealEstateListItem>> asyncResultReResultsList;
    List<RealEstateListItem> currentReList = mainState.data;

    PaginationData pagination = mainState.pagination;
    List<dynamic> results = await Future.wait([
      _realEstateRepo.getRealEstatesByCategoryId(
        page: currentReList.length == 0 ? 1 : pagination.currentPage + 1,
        id: id,
      ),
    ]);
    try {
      asyncResultReResultsList = results[0] as AsyncResult<List<RealEstateListItem>>;
    } catch (error) {
      throw Exception('$tag - Could not get real estates by category data: $error');
    }

    if (asyncResultReResultsList.pagination.total == 0) {
      throw NoResultsException();
    }

    return AsyncResult(
      data: [...currentReList, ...asyncResultReResultsList.data],
      pagination: asyncResultReResultsList.pagination,
    );
  }
}
