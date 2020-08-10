import 'package:allenrealestateflutter/core/data_models/real_estate.dart';

// WARNING:
final RealEstateCategory housesCategory =
    RealEstateCategory(id: 'dev-cat-id-1', name: 'Houses', image: 'lib/ui/assets/img/house.png');
final RealEstateCategory apartmentsCategory =
    RealEstateCategory(id: 'dev-cat-id-2', name: 'Apartments', image: 'lib/ui/assets/img/building.png');
final RealEstateCategory farmsCategory =
    RealEstateCategory(id: 'dev-cat-id-3', name: 'Farms', image: 'lib/ui/assets/img/farm.png');

final List<RealEstateCategory> categoryList = [
  housesCategory,
  apartmentsCategory,
  farmsCategory,
];
