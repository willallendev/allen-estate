import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/ui/widgets/carousels/image_carousel/image_carousel.dart';
import 'package:allenrealestateflutter/ui/widgets/carousels/re_carousel/re_carousel.dart';
import 'package:allenrealestateflutter/ui/widgets/description_preview/description_preview.dart';
import 'package:allenrealestateflutter/ui/widgets/info_map/info_map.dart';
import 'package:allenrealestateflutter/ui/widgets/re_info_icons/re_info_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReEstateSingleScreen extends StatelessWidget {
  final RealEstate realEstate;
  final List<RealEstateListItem> carouselRealEstateList;

  ReEstateSingleScreen({this.realEstate, this.carouselRealEstateList});

  @override
  Widget build(BuildContext context) {
    final re = realEstate;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Theme(
        data: theme.copyWith(accentColor: Colors.white),
        child: ListView(
          children: [
            ImageCarousel(
              images: re.images,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                '${re.type.toCapitalized()} ${re.dealType.name} in',
                style: textTheme.subtitle2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: Text(
                re.shortAddress,
                style: textTheme.headline4.copyWith(color: theme.primaryColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 24),
              child: ReInfoIcons(
                bathrooms: re.bathrooms,
                parkingSlots: re.parkingSlots,
                bedrooms: re.bedrooms,
                sqrSpace: re.sqrSpace,
                config: InfoIconsConfig.defaultConfig(
                  layout: InfoIconsLayout.row,
                  iconSize: 16,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: DescriptionPreview(text: re.description),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
              child: InfoMap(lat: re.lat, long: re.long),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: _buildAddress(context),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Popular', style: textTheme.headline5.copyWith(color: theme.primaryColor)),
            ),
            Container(height: 16),
            ReCarousel(realEstateList: carouselRealEstateList, onTap: (_) => {}),
            Container(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildAddress(BuildContext context) {
    RealEstate re = realEstate;
    String address = '${re.street ?? ''}, ${re.city ?? ''} ${re.postalCode ?? ''}, ${re.countryCode ?? ''}';
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Text(
        address,
        style: textTheme.caption.copyWith(color: theme.primaryColor),
      ),
    );
  }
}

extension CapExtension on String {
  String toCapitalized() => '${this[0].toUpperCase()}${this.substring(1)}';
}
