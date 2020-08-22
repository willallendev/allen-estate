import 'package:allenrealestateflutter/core/data_models/real_estate.dart';

// WARNING:
final RealEstateCategory housesCategory = RealEstateCategory(id: 'house', name: 'Houses', image: 'lib/ui/assets/img/house.png');
final RealEstateCategory apartmentsCategory =
    RealEstateCategory(id: 'apartment', name: 'Apartments', image: 'lib/ui/assets/img/building.png');
final RealEstateCategory farmsCategory = RealEstateCategory(id: 'farm', name: 'Farms', image: 'lib/ui/assets/img/farm.png');

final List<RealEstateCategory> categoryList = [
  housesCategory,
  apartmentsCategory,
  farmsCategory,
];
