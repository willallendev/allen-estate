import 'package:flutter/foundation.dart';

enum ReDealType {
  forSale,
  forRent,
}

extension toString on ReDealType {
  // ignore: missing_return
  String get name {
    switch (this) {
      case ReDealType.forSale:
        return "for sale";
      case ReDealType.forRent:
        return "for rent";
      default:
        {
          return "undefined";
        }
    }
  }
}

class RealEstate {
  final String id;
  final String description;
  final ReDealType dealType; // one of: for rent,for sale
  final String type;
  final int price;
  final List<String> images;
  final int sqrSpace;
  final int bedrooms;
  final int bathrooms;
  final int parkingSlots;
  final String shortAddress;
  final double lat;
  final double long;
  final String street;
  final String city;
  final String postalCode;
  final String countryCode;
  final String url;

  RealEstate(
      {this.id,
      this.url,
      this.description,
      this.dealType,
      this.type,
      this.price,
      this.images,
      this.sqrSpace,
      this.bedrooms,
      this.bathrooms,
      this.parkingSlots,
      this.shortAddress,
      this.lat,
      this.long,
      this.street,
      this.city,
      this.postalCode,
      this.countryCode});

  @override
  String toString() {
    return 'RealEstate{id: $id, description: $description, dealType: $dealType, type: $type, price: $price, images: $images, sqrSpace: $sqrSpace, bedrooms: $bedrooms, bathrooms: $bathrooms, parkingSlots: $parkingSlots, shortAddress: $shortAddress, lat: $lat, long: $long, street: $street, city: $city, postalCode: $postalCode, countryCode: $countryCode, url: $url}';
  }
}

class RealEstateListItem {
  final String id;
  final ReDealType dealType; // one of: for rent,for sale
  final String type;
  final String shortAddress;
  final int price;
  final String thumbnail;
  final int sqrSpace;
  final int bedrooms;
  final int bathrooms;
  final int parkingSlots;

  RealEstateListItem({
    @required this.id,
    @required this.dealType,
    @required this.type,
    @required this.shortAddress,
    @required this.price,
    this.thumbnail,
    this.sqrSpace,
    this.bedrooms,
    this.bathrooms,
    this.parkingSlots,
  })  : assert(id != null),
        assert(dealType != null),
        assert(type != null),
        assert(shortAddress != null),
        assert(price != null),
        assert((sqrSpace != null && sqrSpace > 0) || (sqrSpace == null)),
        assert((bedrooms != null && bedrooms > 0) || (bedrooms == null)),
        assert((bathrooms != null && bathrooms > 0) || (bathrooms == null)),
        assert((parkingSlots != null && parkingSlots > 0) || (parkingSlots == null));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RealEstateListItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          dealType == other.dealType &&
          type == other.type &&
          shortAddress == other.shortAddress &&
          price == other.price &&
          thumbnail == other.thumbnail &&
          sqrSpace == other.sqrSpace &&
          bedrooms == other.bedrooms &&
          bathrooms == other.bathrooms &&
          parkingSlots == other.parkingSlots;

  @override
  int get hashCode =>
      id.hashCode ^
      dealType.hashCode ^
      type.hashCode ^
      shortAddress.hashCode ^
      price.hashCode ^
      thumbnail.hashCode ^
      sqrSpace.hashCode ^
      bedrooms.hashCode ^
      bathrooms.hashCode ^
      parkingSlots.hashCode;
}

class RealEstateCategory {
  final String id;
  final String name;
  final String image;

  RealEstateCategory({
    @required this.id,
    @required this.name,
    @required this.image,
  })  : assert(id != null),
        assert(name != null),
        assert(image != null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RealEstateCategory && runtimeType == other.runtimeType && id == other.id && name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
