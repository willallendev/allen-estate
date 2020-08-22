import 'dart:developer';

import 'package:allenrealestateflutter/core/data_models/async_result.dart';
import 'package:allenrealestateflutter/core/data_models/pagination_data.dart';
import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/core/services/real_estate_service/implementations/mock/mock_db.dart';
import 'package:allenrealestateflutter/core/services/real_estate_service/implementations/mock/parsers.dart' as parser;
import 'package:allenrealestateflutter/core/services/real_estate_service/real_estate_service.dart';
import 'package:injectable/injectable.dart';

@Environment("test")
@Injectable(as: RealEstateService)
class RealEstateMockService extends RealEstateService {
  static const tag = 'RealEstateMockService';
  final List<Map> mockReList = realEstateList;

  @override
  Future<AsyncResult<List<RealEstateListItem>>> getPopularRealEstates({int page = 1, int size = 10}) async {
    log('Fetching results. page: $page, size: $size', name: '$tag/getPopularRealEstates');
    List<RealEstateListItem> results = mockReList.sublist(50, 55).map((e) => parser.realEstateListItemFromJson(e)).toList();
    await Future.delayed(Duration(milliseconds: 450));
    return AsyncResult(data: results);
  }

  @override
  Future<AsyncResult<List<RealEstateListItem>>> getRealEstatesByQuery({int page = 1, int size = 10, String query}) async {
    log('Fetching results. page: $page, size: $size, query: $query', name: '$tag/getRealEstatesByQuery');
    List<RealEstateListItem> results = mockReList
        .sublist((page - 1) * size, (page - 1) * size + size)
        .map((e) => parser.realEstateListItemFromJson(e))
        .toList();
    PaginationData paginationData = PaginationData(
      total: results.length,
      perPage: size,
      lastPage: (mockReList.length / size).truncate(),
      currentPage: page,
    );
    await Future.delayed(Duration(milliseconds: 450));
    return AsyncResult(data: results, pagination: paginationData);
  }

  @override
  Future<AsyncResult<RealEstate>> getRealEstateById({String id}) async {
    log('Fetching results. id: $id', name: '$tag/getRealEstateById');
    List<RealEstate> data = mockReList.map((e) => parser.realEstateFromJson(e)).toList();
    RealEstate results = data.firstWhere((RealEstate element) => element.id == id, orElse: null);
    if (results == null) {
      throw Exception('Could not find requested real estate');
    }
    await Future.delayed(Duration(milliseconds: 450));
    return AsyncResult(data: results);
  }

  @override
  Future<AsyncResult<List<RealEstateListItem>>> getSimilarRealEstatesById({String id, int page = 1, int size = 10}) async {
    log('Fetching results id: $id. page: $page, size: $size', name: '$tag/getSimilarRealEstatesById');
    List<RealEstateListItem> results = mockReList
        .sublist((page - 1) * size, (page - 1) * size + size)
        .map((e) => parser.realEstateListItemFromJson(e))
        .toList();
    PaginationData paginationData = PaginationData(
      total: results.length,
      perPage: size,
      lastPage: (mockReList.length / size).truncate(),
      currentPage: page,
    );
    await Future.delayed(Duration(milliseconds: 450));
    return AsyncResult(data: results, pagination: paginationData);
  }

  @override
  Future<AsyncResult<List<RealEstateListItem>>> getRealEstatesByCategoryId({String id, int page = 1, int size = 10}) async {
    log('Fetching results id: $id. page: $page, size: $size', name: '$tag/getRealEstatesByCategoryId');
    List<RealEstateListItem> results = mockReList
        .sublist((page - 1) * size, (page - 1) * size + size)
        .map((e) => parser.realEstateListItemFromJson(e))
        .toList();
    PaginationData paginationData = PaginationData(
      total: results.length,
      perPage: size,
      lastPage: (mockReList.length / size).truncate(),
      currentPage: page,
    );
    await Future.delayed(Duration(milliseconds: 450));
    return AsyncResult(data: results, pagination: paginationData);
  }
}
