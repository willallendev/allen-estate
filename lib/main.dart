import 'package:allenrealestateflutter/core/ioc/locator.dart';
import 'package:allenrealestateflutter/ui/settings/licenses/licenses.dart';
import 'package:allenrealestateflutter/ui/settings/router/router.gr.dart';
import 'package:allenrealestateflutter/ui/settings/theme/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

void main() {
  Intl.defaultLocale = 'en_US';
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
    // Sets system status bar color tu transparent
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
      title: 'Flutter Demo',
      theme: buildAppTheme(),
      builder: ExtendedNavigator<Router>(router: Router()),
    );
  }
}
