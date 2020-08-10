import 'dart:developer';

import 'package:allenrealestateflutter/core/data_models/async_result.dart';
import 'package:allenrealestateflutter/core/data_models/pagination_data.dart';
import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/core/services/real_estate_service/implementations/mock/mock_db.dart';
import 'package:allenrealestateflutter/core/services/real_estate_service/real_estate_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RealEstateService)
class RealEstateMockService extends RealEstateService {
  static const tag = 'RealEstateMockService';
  final List<Map> mockReList = realEstateList;

  @override
  Future<AsyncResult<List<RealEstateListItem>>> getPopularRealEstates({int page = 0, int size = 10}) async {
    log('Fetching results. page: $page, size: $size', name: '$tag/getPopularRealEstates');
    List<RealEstateListItem> results = mockReList.sublist(50, 55).map((e) => realEstateListItemFromJson(e)).toList();
    await Future.delayed(Duration(seconds: 5));
    return AsyncResult(data: results);
  }

  @override
  Future<AsyncResult<List<RealEstateListItem>>> getRealEstatesByQuery({int page = 0, int size = 10, String query}) async {
    log('Fetching results. page: $page, size: $size, query: $query', name: '$tag/getRealEstatesByQuery');
    List<RealEstateListItem> results =
        mockReList.sublist(page * size, page * size + size).map((e) => realEstateListItemFromJson(e)).toList();
    PaginationData paginationData = PaginationData(
      total: results.length,
      perPage: size,
      lastPage: (mockReList.length / size).truncate(),
      currentPage: page,
    );
    await Future.delayed(Duration(seconds: 5));
    return AsyncResult(data: results, pagination: paginationData);
  }
}

RealEstateListItem realEstateListItemFromJson(Map json) {
  ReDealType dealType = json['dealType'] == 'for sale' ? ReDealType.forSale : ReDealType.forRent;
  return RealEstateListItem(
    id: json['id'],
    dealType: dealType,
    type: json['type'],
    shortAddress: json['location']['shortAddress'],
    price: json['price'],
    parkingSlots: json['parkingSlots'],
    bathrooms: json['bathrooms'],
    bedrooms: json['bedrooms'],
    sqrSpace: json['sqrSpace'],
    thumbnail: json['media']['thumbnail'],
  );
}
