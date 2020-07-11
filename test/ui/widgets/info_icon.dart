import 'package:allenrealestateflutter/ui/widgets/info_icon/info_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void infoIconTest() {
  final info = '1024m²';
  final icon = FaIcon(FontAwesomeIcons.ruler);

  final testSubject = MaterialApp(
    home: InfoIcon(
      info: info,
      icon: icon,
    ),
  );

  testWidgets('InfoIcon Widget Layout Test', (WidgetTester tester) async {
    await tester.pumpWidget(testSubject);
    final infoTextWidget = find.byType(Text);
    final iconWidget = find.byType(FaIcon);

    expect(infoTextWidget, findsOneWidget);
    expect(iconWidget, findsOneWidget);
  });

  testWidgets('InfoIcon Widget text widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(testSubject);

    expect(find.text(info), findsOneWidget);
  });
}
