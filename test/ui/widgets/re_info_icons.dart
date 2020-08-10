import 'package:allenrealestateflutter/ui/widgets/info_icon/info_icon.dart';
import 'package:allenrealestateflutter/ui/widgets/re_info_icons/re_info_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void reInfoIconsTest() {
  final sqrSpace = 9898;
  final bedrooms = 98;
  final bathrooms = 89;
  final parkingSlots = 78;

  final testSubject1 = MaterialApp(
    home: ReInfoIcons(
      sqrSpace: sqrSpace,
      bedrooms: bedrooms,
      bathrooms: bathrooms,
      parkingSlots: parkingSlots,
    ),
  );

  final testSubject2 = MaterialApp(
    home: ReInfoIcons(
      sqrSpace: sqrSpace,
    ),
  );

  final testSubject3 = MaterialApp(
    home: ReInfoIcons(
      bathrooms: bathrooms,
      parkingSlots: parkingSlots,
    ),
  );

  final testSubject4 = MaterialApp(
    home: Column(
      children: <Widget>[ReInfoIcons()],
    ),
  );

  final testSubject5 = MaterialApp(
    home: ReInfoIcons(
      sqrSpace: sqrSpace,
      bedrooms: bedrooms,
      bathrooms: bathrooms,
      parkingSlots: parkingSlots,
      config: InfoIconsConfig.defaultConfig(sqrSpaceSymbol: 'ft²'),
    ),
  );

  testWidgets('ReInfoIcons Widget Layout Test1, 4 InfoIcon should be displayed and match data', (WidgetTester tester) async {
    await tester.pumpWidget(testSubject1);
    final infoIconWidget = find.byType(InfoIcon);
    expect(infoIconWidget, findsNWidgets(4));
    expect(find.text('${sqrSpace}m²'), findsOneWidget);
    expect(find.text(bedrooms.toString()), findsOneWidget);
    expect(find.text(bathrooms.toString()), findsOneWidget);
    expect(find.text(parkingSlots.toString()), findsOneWidget);
  });

  testWidgets('ReInfoIcons Widget Layout Test2, 1 InfoIcon should be displayed and match data', (WidgetTester tester) async {
    await tester.pumpWidget(testSubject2);
    final infoIconWidget = find.byType(InfoIcon);
    expect(infoIconWidget, findsOneWidget);
    expect(find.text('${sqrSpace}m²'), findsOneWidget);
  });

  testWidgets('ReInfoIcons Widget Layout Test3, 2 InfoIcon should be displayed and match data', (WidgetTester tester) async {
    await tester.pumpWidget(testSubject3);
    final infoIconWidget = find.byType(InfoIcon);
    expect(infoIconWidget, findsNWidgets(2));
    expect(find.text('$bathrooms'), findsOneWidget);
    expect(find.text('$parkingSlots'), findsOneWidget);
  });

  testWidgets('ReInfoIcons Widget Layout Test4, no InfoIcon should be displayed', (WidgetTester tester) async {
    await tester.pumpWidget(testSubject4);
    final infoIconWidget = find.byType(InfoIcon);
    expect(infoIconWidget, findsNothing);
  });

  testWidgets('ReInfoIcons Widget Layout Test5 should replace default space units', (WidgetTester tester) async {
    await tester.pumpWidget(testSubject5);
    expect(find.text('${sqrSpace}ft²'), findsOneWidget);
  });
}
