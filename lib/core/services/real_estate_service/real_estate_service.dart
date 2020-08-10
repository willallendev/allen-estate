import 'package:allenrealestateflutter/core/data_models/async_result.dart';
import 'package:allenrealestateflutter/core/data_models/real_estate.dart';

abstract class RealEstateService {
  Future<AsyncResult<List<RealEstateListItem>>> getPopularRealEstates({page = 0, size = 10});
}
