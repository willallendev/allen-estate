import 'package:allenrealestateflutter/core/data_models/async_result.dart';
import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/core/ioc/locator.dart';
import 'package:allenrealestateflutter/core/services/real_estate_service/real_estate_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RealEstateRepository {
  final RealEstateService webService = locator.get<RealEstateService>();

  Future<AsyncResult<List<RealEstateListItem>>> getPopularRealEstates({page = 1, size = 10}) {
    return webService.getPopularRealEstates(page: page, size: size);
  }

  Future<AsyncResult<List<RealEstateListItem>>> getRealEstatesByQuery({int page = 1, int size = 10, String query}) {
    return webService.getRealEstatesByQuery(page: page, size: size, query: query);
  }

  Future<AsyncResult<RealEstate>> getRealEstateById({String id}) {
    return webService.getRealEstateById(id: id);
  }

  Future<AsyncResult<List<RealEstateListItem>>> getSimilarRealEstatesById({int page = 1, int size = 10, String id}) {
    return webService.getSimilarRealEstatesById(page: page, size: size, id: id);
  }

  Future<AsyncResult<List<RealEstateListItem>>> getRealEstatesByCategoryId({int page = 1, int size = 10, String id}) {
    return webService.getRealEstatesByCategoryId(page: page, size: size, id: id);
  }
}
