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
}
