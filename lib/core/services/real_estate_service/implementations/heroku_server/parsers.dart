import 'package:allenrealestateflutter/core/data_models/real_estate.dart';

String _toCapitalized(String string) => '${string[0].toUpperCase()}${string.substring(1)}';

RealEstateListItem realEstateListItemFromMap(Map map) {
  ReDealType dealType = map['deal_type'] == 'for sale' ? ReDealType.forSale : ReDealType.forRent;
  String city = _toCapitalized(map['city']);
  String cityArea = _toCapitalized(map['city_area']);
  return RealEstateListItem(
    id: map['id'].toString(),
    thumbnail: map['thumbnail'],
    type: map['type'],
    dealType: dealType,
    price: map['price'],
    sqrSpace: map['square_space'],
    bedrooms: map['bedrooms'],
    bathrooms: map['bathrooms'],
    parkingSlots: map['parking_slots'],
    shortAddress: '$city - $cityArea',
  );
}

RealEstate realEstateFromMap(Map map) {
  String id = map['id'].toString();
  ReDealType dealType = map['deal_type'] == 'for sale' ? ReDealType.forSale : ReDealType.forRent;
  String city = _toCapitalized(map['city']);
  String cityArea = _toCapitalized(map['city_area']);
  List<String> images = [map['thumbnail'], ...(map['images'] != null ? map['images'] : [])];
  return RealEstate(
    id: id,
    url: 'http://allen-real-estate-rest.herokuapp.com/api/v1/real-estates/$id',
    dealType: dealType,
    type: _toCapitalized(map['type']),
    shortAddress: '$city - $cityArea',
    price: map['price'],
    parkingSlots: map['parking_slots'],
    bathrooms: map['bathrooms'],
    bedrooms: map['bedrooms'],
    sqrSpace: map['square_space'],
    images: images,
    city: map['city'],
    countryCode: map['country_code'],
    postalCode: map['postal_code'],
    lat: map['latitude'],
    long: map['longitude'],
    street: map['street_address'],
    description: map['description'],
  );
}
