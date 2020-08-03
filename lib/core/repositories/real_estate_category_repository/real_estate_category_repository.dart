import 'package:allenrealestateflutter/core/data_models/async_result.dart';
import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/core/repositories/real_estate_category_repository/data.dart' as staticData;
import 'package:injectable/injectable.dart';

@lazySingleton
class RealEstateCategoryRepository {
  Future<AsyncResult<List<RealEstateCategory>>> getRealEstateCategories({page = 0, size = 10}) async {
    return AsyncResult(data: staticData.categoryList);
  }
}
