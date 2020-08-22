import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/ui/widgets/re_info_icons/re_info_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class ReCard extends StatelessWidget {
  static const TAG = 'ReCard';

  final RealEstateListItem realEstate;
  final void Function(RealEstateListItem realEstate) onTap;

  // 9:16 aspect ratio
  static double _cardHeight = 496;
  static double _cardWidth = 279;
  static double _cardBottomPadding = 5;
  static double height = _cardHeight + _cardBottomPadding;

  final _nFormat = NumberFormat.compactCurrency(decimalDigits: 0, symbol: '\$');

  ReCard({this.realEstate, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final re = realEstate;
    return Padding(
      padding: EdgeInsets.only(bottom: _cardBottomPadding),
      child: SizedBox(
        width: _cardWidth,
        height: _cardHeight,
        child: Card(
          clipBehavior: Clip.antiAlias,
          color: theme.cardColor,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(16),
          ),
          child: GestureDetector(
            onTap: () => onTap?.call(re),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildCoverImage(textTheme, theme, re),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _buildDealTypeText(re, textTheme, theme),
                            Container(height: 4),
                            _buildTypeText(re, textTheme),
                            Container(height: 4),
                            _buildShortAddressText(re, textTheme),
                            Container(height: 8),
                            _buildPriceText(re, textTheme, theme),
                          ],
                        ),
                      ),
                      Container(
                        height: 119,
                        child: ReInfoIcons(
                          config: InfoIconsConfig.defaultConfig(
                            layout: InfoIconsLayout.column,
                            iconSize: 12,
                            fontSize: 10,
                            textIconSpace: 2,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                          ),
                          sqrSpace: re.sqrSpace,
                          bedrooms: re.bedrooms,
                          bathrooms: re.bathrooms,
                          parkingSlots: re.parkingSlots,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPriceText(RealEstateListItem re, TextTheme textTheme, ThemeData theme) {
    return Text(
      _nFormat.format(re.price).replaceAll('K', '.000'),
      style: textTheme.headline4.copyWith(color: theme.secondaryHeaderColor),
    );
  }

  Widget _buildShortAddressText(RealEstateListItem re, TextTheme textTheme) {
    return Text(
      re.shortAddress,
      style: textTheme.headline6,
      softWrap: false,
      overflow: TextOverflow.fade,
    );
  }

  Widget _buildTypeText(RealEstateListItem re, TextTheme textTheme) {
    return Text(
      re.type.toCapitalized(),
      style: textTheme.headline5,
    );
  }

  Widget _buildDealTypeText(RealEstateListItem re, TextTheme textTheme, ThemeData theme) {
    return Text(
      re.dealType.name.toCapitalized(),
      style: textTheme.overline.copyWith(color: theme.secondaryHeaderColor),
    );
  }

  // TODO: Refactor to use custom network image
  Widget _buildCoverImage(TextTheme textTheme, ThemeData theme, RealEstateListItem re) {
    return Expanded(
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FaIcon(FontAwesomeIcons.solidDizzy, color: textTheme.bodyText1.color),
              Container(height: 16),
              Text('Could not load image', style: textTheme.caption.copyWith(color: textTheme.bodyText1.color)),
            ],
          ),
        ),
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor),
          ),
        ),
        imageUrl: re.thumbnail,
      ),
    );
  }
}

extension CapExtension on String {
  String toCapitalized() => '${this[0].toUpperCase()}${this.substring(1)}';
}
