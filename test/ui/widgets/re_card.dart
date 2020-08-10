import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/ui/widgets/cards/re_card/re_card.dart';
import 'package:allenrealestateflutter/ui/widgets/re_info_icons/re_info_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension _StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${this.substring(1).toLowerCase()}';
  }
}

void reCardTest() {
  final RealEstateListItem item = RealEstateListItem(
    id: 'test-re-1',
    dealType: ReDealType.forRent,
    type: 'apartment',
    shortAddress: 'London - Stratford',
    price: 1000000,
    thumbnail: 'https://absolutely.london/wp-content/uploads/2017/06/Hero_-3Bed_Living__Tower_Bridge_Day-1068x712.png',
    bathrooms: 4,
    bedrooms: 3,
    parkingSlots: 2,
    sqrSpace: 250,
  );

  final testSubject = MaterialApp(
    home: ReCard(realEstate: item),
  );

  testWidgets('ReCard Widget Layout', (WidgetTester t) async {
    await t.pumpWidget(testSubject);
    final reInfoIcons = find.byType(ReInfoIcons);
    final image = find.byType(CachedNetworkImage);

    expect(find.text(item.dealType.name.capitalize()), findsOneWidget);
    expect(find.text(item.type.capitalize()), findsOneWidget);
    expect(find.text(item.shortAddress), findsOneWidget);
    expect(image, findsOneWidget);
    expect(reInfoIcons, findsOneWidget);
  });
}
