import 'package:allenrealestateflutter/ui/widgets/custom_network_image/custom_network_image.dart';
import 'package:allenrealestateflutter/ui/widgets/info_map/config.secret.dart' as secret;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:mapbox_search/mapbox_search.dart';

// TODO: Cleanup/simplify code
class InfoMap extends StatelessWidget {
  final double lat;
  final double long;
  final MapBoxStaticImage staticImage = MapBoxStaticImage(apiKey: secret.apiKey);

  InfoMap({this.lat, this.long});

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
    var height = 336.0;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      height: height,
      width: double.infinity,
      child: GestureDetector(
        onPanStart: (_) => _showSimpleSnackBar(context, 'Tap map to launch map app'),
        onTap: () => _launchMapApp(context),
        child: CustomNetworkImage(
          imageUrl: staticImage.getStaticUrlWithMarker(
            center: Location(lat: lat, lng: long),
            marker: MapBoxMarker(
              markerColor: Color.hex('48A999'),
              markerLetter: 'o',
              markerSize: MarkerSize.SMALL,
            ),
            height: height.truncate(),
            width: height.truncate(),
            zoomLevel: 14,
            style: MapBoxStyle.Streets,
            render2x: true,
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
