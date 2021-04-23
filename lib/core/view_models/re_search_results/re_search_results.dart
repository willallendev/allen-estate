import 'package:allenrealestateflutter/core/data_models/async_result.dart';
import 'package:allenrealestateflutter/core/data_models/pagination_data.dart';
import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/core/ioc/locator.dart';
import 'package:allenrealestateflutter/core/repositories/real_estate_repository/real_estate_repository.dart';
import 'package:allenrealestateflutter/core/view_models/base_view_model/base_view_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReSearchResultsViewModel extends BaseViewModel {
  static const tag = 'ReSearchResultsViewModel';
  static const _mainStateTag = 'main';
  RealEstateRepository _realEstateRepo = locator<RealEstateRepository>();
  String query;
  bool flagModal = false;
  var dio = Dio();
  CancelToken token = CancelToken();
  bool loadToken = false;

  ViewModelStatePiece<List<RealEstateListItem>> get mainState =>
      state[_mainStateTag];

  ReSearchResultsViewModel() {
    dio.interceptors.add(LogInterceptor());

    this.createStatePiece<List<RealEstateListItem>>(
      _mainStateTag,
      data: <RealEstateListItem>[],
      pagination: PaginationData(),
    );
  }

  void init() {
    this.mapFutureResultToState<List<RealEstateListItem>>(
        key: _mainStateTag, resultGenerator: () => _getSearchResults());
  }

  Future<AsyncResult<List<RealEstateListItem>>> _getSearchResults() async {
    flagModal = true;
    notifyListeners();

    AsyncResult<List<RealEstateListItem>> asyncResultReResultsList;
    List<RealEstateListItem> currentReList = mainState.data;

    PaginationData pagination = mainState.pagination;

    if (loadToken) {
      token.cancel('cancelled');
    }

    List<dynamic> results = await Future.wait([
      _realEstateRepo.getRealEstatesByQuery(
        cancelToken: token,
        page: currentReList.length == 0 ? 1 : pagination.currentPage + 1,
        query: query,
      ),
    ]);
    try {
      asyncResultReResultsList =
          results[0] as AsyncResult<List<RealEstateListItem>>;
    } catch (error) {
      throw Exception('$tag - Could not get search results data: $error');
    }

    if (asyncResultReResultsList.pagination.total == 0) {
      throw NoResultsException();
    }
    notifyListeners();
    flagModal = false;
    return AsyncResult(
      data: [...currentReList, ...asyncResultReResultsList.data],
      pagination: asyncResultReResultsList.pagination,
    );
  }
}
