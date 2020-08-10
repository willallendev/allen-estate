import 'package:allenrealestateflutter/core/data_models/async_result.dart';
import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/core/services/real_estate_service/real_estate_service.dart';
import 'package:injectable/injectable.dart';

import 'data.dart';

@LazySingleton(as: RealEstateService)
class RealEstateMockService extends RealEstateService {
  @override
  Future<AsyncResult<List<RealEstateListItem>>> getPopularRealEstates({page = 0, size = 10}) async {
    await Future.delayed(Duration(seconds: 5));
    return AsyncResult(data: listItemList);
  }
}
