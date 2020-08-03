import 'package:allenrealestateflutter/core/data_models/real_estate.dart';

final RealEstateListItem listItem1 = RealEstateListItem(
  id: 'test-re-1',
  dealType: ReDealType.forRent,
  type: 'apartment',
  shortAddress: 'London - Stratford',
  price: 1260000,
  thumbnail: 'https://assets.reapit.net/stp/live/pictures/LKN/16/LKN160069_06.jpg',
  bathrooms: 4,
  bedrooms: 3,
  parkingSlots: 2,
  sqrSpace: 80,
);

final RealEstateListItem listItem2 = RealEstateListItem(
  id: 'test-re-2',
  dealType: ReDealType.forRent,
  type: 'apartment',
  shortAddress: 'London - Stratford',
  price: 800000,
  thumbnail: 'https://i.pinimg.com/originals/ba/61/cc/ba61cc38f919bbfb8f7cbac8a6b3a434.jpg',
  bathrooms: 3,
  bedrooms: 2,
  parkingSlots: 1,
  sqrSpace: 72,
);

final RealEstateListItem listItem3 = RealEstateListItem(
  id: 'test-re-3',
  dealType: ReDealType.forRent,
  type: 'house',
  shortAddress: 'London - Stratford',
  price: 2260000,
  thumbnail:
      'https://www.taylorwimpey.co.uk/-/media/Regions/East%20London/Sales/Chobham%20Manor/Phase%202%20CGI%20and%20internal%20photography/The-Walbrook-Special_WEB.JPG',
  bathrooms: 4,
  bedrooms: 3,
  parkingSlots: 2,
  sqrSpace: 12,
);

final List<RealEstateListItem> listItemList = [
  listItem1,
  listItem2,
  listItem3,
];
