import 'package:allenrealestateflutter/core/data_models/async_result.dart';
import 'package:allenrealestateflutter/core/data_models/pagination_data.dart';
import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/core/ioc/locator.dart';
import 'package:allenrealestateflutter/core/repositories/real_estate_repository/real_estate_repository.dart';
import 'package:allenrealestateflutter/core/view_models/base_view_model/base_view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReSearchResultsViewModel extends BaseViewModel {
  static const tag = 'HomeViewModel';
  static const _realEstatesDataTag = 'reList';
  RealEstateRepository _realEstateRepo = locator<RealEstateRepository>();
  String query;

  ViewModelStatePiece<List<RealEstateListItem>> get realEstatesData => state[_realEstatesDataTag];

  ReSearchResultsViewModel() {
    this.createStatePiece<List<RealEstateListItem>>(_realEstatesDataTag,
        data: <RealEstateListItem>[], pagination: PaginationData());
  }

  void init() {
    this.mapFutureResultToState<List<RealEstateListItem>>(key: _realEstatesDataTag, resultGenerator: () => _getSearchResults());
  }

  Future<AsyncResult<List<RealEstateListItem>>> _getSearchResults() async {
    AsyncResult<List<RealEstateListItem>> asyncResultReResultsList;
    List<RealEstateListItem> currentReList = realEstatesData.data;

    PaginationData pagination = realEstatesData.pagination;
    List<dynamic> results = await Future.wait([
      _realEstateRepo.getRealEstatesByQuery(
        page: currentReList.length == 0 ? 1 : pagination.currentPage + 1,
        query: query,
      ),
    ]);
    try {
      asyncResultReResultsList = results[0] as AsyncResult<List<RealEstateListItem>>;
    } catch (error) {
      throw Exception('$tag - Could not get home data: $error');
    }

    return AsyncResult(
      data: [...currentReList, ...asyncResultReResultsList.data],
      pagination: asyncResultReResultsList.pagination,
    );
  }
}
