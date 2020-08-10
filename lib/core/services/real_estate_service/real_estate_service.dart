import 'package:allenrealestateflutter/core/data_models/async_result.dart';
import 'package:allenrealestateflutter/core/data_models/real_estate.dart';

abstract class RealEstateService {
  Future<AsyncResult<List<RealEstateListItem>>> getPopularRealEstates({int page = 0, int size = 10});

  Future<AsyncResult<List<RealEstateListItem>>> getRealEstatesByQuery({int page = 0, int size = 10, String query});
}
