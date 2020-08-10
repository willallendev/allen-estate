import 'package:allenrealestateflutter/core/data_models/async_result.dart';
import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/core/ioc/locator.dart';
import 'package:allenrealestateflutter/core/services/real_estate_service/real_estate_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RealEstateRepository {
  final RealEstateService webService = locator.get<RealEstateService>();

  Future<AsyncResult<List<RealEstateListItem>>> getPopularRealEstates({page = 0, size = 10}) {
    return webService.getPopularRealEstates(page: page, size: size);
  }
}
