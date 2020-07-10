import 'package:allenrealestateflutter/core/ioc/locator.dart';
import 'package:allenrealestateflutter/ui/settings/licenses/licenses.dart';
import 'package:allenrealestateflutter/ui/settings/router/router.gr.dart';
import 'package:allenrealestateflutter/ui/settings/theme/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  setupLicenses();
  runApp(
    DevicePreview(
      usePreferences: true,
      enabled: !Foundation.kReleaseMode,
      builder: (context) => AllenEstateApp(),
    ),
  );
}

class AllenEstateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      builder: ExtendedNavigator<Router>(router: Router()),
    );
  }
}
