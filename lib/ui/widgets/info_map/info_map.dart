import 'dart:developer';

import 'package:allenrealestateflutter/ui/widgets/animations/explicit_tween_animation_builder.dart';
import 'package:allenrealestateflutter/ui/widgets/custom_network_image/custom_network_image.dart';
import 'package:allenrealestateflutter/ui/widgets/info_map/config.secret.dart' as secret;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:mapbox_search/mapbox_search.dart';

// TODO: Cleanup/simplify code
class InfoMap extends StatelessWidget {
  static const tag = 'InfoMap';
  final double lat;
  final double long;
  final int zoomLevel;
  final MapBoxStaticImage staticImage = MapBoxStaticImage(apiKey: secret.apiKey);

  InfoMap({this.lat, this.long, this.zoomLevel = 14});

  void _launchMapApp(BuildContext context) async {
    MapType mapType;
    if (await MapLauncher.isMapAvailable(MapType.google)) {
      mapType = MapType.google;
    } else if (await MapLauncher.isMapAvailable(MapType.apple)) {
      mapType = MapType.apple;
    }

    if (mapType != null) {
      await MapLauncher.showMarker(
        mapType: mapType,
        coords: Coords(lat, long),
        title: 'Allen Real Estate',
      );
    } else {
      final availableMaps = await MapLauncher.installedMaps;
      if (availableMaps.isNotEmpty) {
        await availableMaps.first.showMarker(
          coords: Coords(lat, long),
          title: "Allen Real Estate",
        );
      } else {
        _showSimpleSnackBar(context, 'Could not find map app');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    var height = 336.0;

    return Container(
      height: height,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: ExplicitTweenAnimationBuilder(
        blinkAtStart: true,
        duration: Duration(milliseconds: 450),
        tween: Tween<double>(begin: 0, end: 1),
        builder: (context, controller, animation) => GestureDetector(
          onPanStart: (_) => controller.forward().catchError((e) => log(e, name: '$tag/onPanStart')),
          onPanEnd: (_) => controller.reverse().catchError((e) => log(e, name: '$tag/onPanEnd')),
          onTap: () => _launchMapApp(context),
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              CustomNetworkImage(
                backgroundColor: Colors.black.withOpacity(.2),
                imageUrl: staticImage.getStaticUrlWithMarker(
                  center: Location(lat: lat, lng: long),
                  marker: MapBoxMarker(
                    markerColor: Color.hex('48A999'),
                    markerLetter: 'o',
                    markerSize: MarkerSize.SMALL,
                  ),
                  height: height.truncate(),
                  width: height.truncate(),
                  zoomLevel: zoomLevel ?? 14,
                  style: MapBoxStyle.Streets,
                  render2x: true,
                ),
              ),
              FadeTransition(
                opacity: animation,
                child: Container(
                  alignment: Alignment.center,
                  color: textTheme.headline1.color.withOpacity(.4),
                  child: Text(
                    'Tap to open map app\n',
                    style: textTheme.headline4.copyWith(color: theme.backgroundColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showSimpleSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
