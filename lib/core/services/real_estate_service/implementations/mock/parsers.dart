import 'package:allenrealestateflutter/core/data_models/real_estate.dart';

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

RealEstate realEstateFromJson(Map json) {
  ReDealType dealType = json['dealType'] == 'for sale' ? ReDealType.forSale : ReDealType.forRent;
  List<String> images = [json['media']['thumbnail'], ...json['media']['images']];
  return RealEstate(
    id: json['id'],
    url: json['url'],
    dealType: dealType,
    type: json['type'],
    shortAddress: json['location']['shortAddress'],
    price: json['price'],
    parkingSlots: json['parkingSlots'],
    bathrooms: json['bathrooms'],
    bedrooms: json['bedrooms'],
    sqrSpace: json['sqrSpace'],
    images: images,
    city: json['location']['city'],
    countryCode: json['location']['countryCode'],
    postalCode: json['location']['postalCode'],
    lat: json['location']['lat'],
    long: json['location']['long'],
    street: json['location']['street'],
    description: json['description'],
  );
}
