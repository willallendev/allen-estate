import 'package:flutter/cupertino.dart';

class RealEstateListItem {
  final String id;
  final String dealType; // one of: for rent,for sale
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
