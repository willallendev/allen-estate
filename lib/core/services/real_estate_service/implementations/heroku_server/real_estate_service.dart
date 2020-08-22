import 'package:allenrealestateflutter/core/data_models/async_result.dart';
import 'package:allenrealestateflutter/core/data_models/pagination_data.dart';
import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/core/services/real_estate_service/implementations/heroku_server/parsers.dart' as parser;
import 'package:allenrealestateflutter/core/services/real_estate_service/real_estate_service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

class Service extends RealEstateService {
  static BaseOptions _options = BaseOptions(
    baseUrl: "https://allen-real-estate-rest.herokuapp.com/api/v1/real-estates/",
    connectTimeout: 20000,
    receiveTimeout: 10000,
  );
  Dio _dio = Dio(_options);

  @override
  Future<AsyncResult<List<RealEstateListItem>>> getPopularRealEstates({int page = 1, int size = 10}) async {
    Response raw = await _dio.get('/popular?page=$page&limit=$size');
    List response = raw.data['data'];
    List<RealEstateListItem> _results = response.map((e) => parser.realEstateListItemFromMap(e)).toList();

    return AsyncResult(data: _results);
  }

  @override
  Future<AsyncResult<RealEstate>> getRealEstateById({String id}) async {
    Response raw = await _dio.get('/$id');
    RealEstate response = parser.realEstateFromMap(raw.data);

    return AsyncResult(data: response);
  }

  @override
  Future<AsyncResult<List<RealEstateListItem>>> getRealEstatesByCategoryId({String id, int page = 1, int size = 10}) async {
    Response raw = await _dio.get('/types/$id?page=$page&limit=$size');
    List response = raw.data['data'];
    List<RealEstateListItem> _results = response.map((e) => parser.realEstateListItemFromMap(e)).toList();
    PaginationData pagination = PaginationData(
      currentPage: raw.data['page'],
      lastPage: raw.data['last_page'],
      perPage: raw.data['limit'],
      total: raw.data['total'],
    );

    return AsyncResult(data: _results, pagination: pagination);
  }

  @override
  Future<AsyncResult<List<RealEstateListItem>>> getRealEstatesByQuery({int page = 1, int size = 10, String query}) async {
    Response raw = await _dio.get('/search?q=$query&page=$page&limit=$size');
    List response = raw.data['data'];
    List<RealEstateListItem> _results = response.map((e) => parser.realEstateListItemFromMap(e)).toList();
    PaginationData pagination = PaginationData(
      currentPage: raw.data['page'],
      lastPage: raw.data['last_page'],
      perPage: raw.data['limit'],
      total: raw.data['total'],
    );

    return AsyncResult(data: _results, pagination: pagination);
  }

  @override
  Future<AsyncResult<List<RealEstateListItem>>> getSimilarRealEstatesById({String id, int page = 1, int size = 10}) {
    // TODO: implement getSimilarRealEstatesById
    throw UnimplementedError();
  }
}

@dev
@Injectable(as: RealEstateService)
class RealEstateHerokuDevService extends Service {}

@prod
@LazySingleton(as: RealEstateService)
class RealEstateHerokuProdService extends Service {}
