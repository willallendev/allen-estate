import 'package:allenrealestateflutter/ui/containers/home/home.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:flutter/material.dart';

void main() {
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeContainer(),
    );
  }
}
