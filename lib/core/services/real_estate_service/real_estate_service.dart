import 'package:allenrealestateflutter/core/data_models/async_result.dart';
import 'package:allenrealestateflutter/core/data_models/real_estate.dart';

abstract class RealEstateService {
  Future<AsyncResult<List<RealEstateListItem>>> getPopularRealEstates({int page = 1, int size = 10});

  Future<AsyncResult<List<RealEstateListItem>>> getRealEstatesByQuery({int page = 1, int size = 10, String query});

  Future<AsyncResult<RealEstate>> getRealEstateById({String id});

  Future<AsyncResult<List<RealEstateListItem>>> getSimilarRealEstatesById({String id, int page = 1, int size = 10});

  Future<AsyncResult<List<RealEstateListItem>>> getRealEstatesByCategoryId({String id, int page = 1, int size = 10});
}
