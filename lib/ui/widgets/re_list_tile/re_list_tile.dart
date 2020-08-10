import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/ui/widgets/custom_network_image/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReListTile extends StatelessWidget {
  static const height = 157.0;
  final RealEstateListItem realEstate;
  final void Function(RealEstateListItem) onTap;
  final String sqrSpaceSymbol;

  final _nFormat = NumberFormat.compactCurrency(decimalDigits: 0, symbol: '\$');

  ReListTile({
    @required this.realEstate,
    this.onTap,
    this.sqrSpaceSymbol = 'm²',
  })  : assert(realEstate != null, 'realEstate param must be provided'),
        assert(sqrSpaceSymbol != null, 'sqrSpaceSymbol cannot be null if provided');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final re = realEstate;

    return InkWell(
      onTap: onTap != null ? () => onTap?.call(re) : null,
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
        height: height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildThumbnail(re),
            Container(width: 24),
            _buildDetails(re, textTheme, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildDetails(RealEstateListItem re, TextTheme textTheme, ThemeData theme) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            re.dealType.name.toCapitalized(),
            style: textTheme.subtitle2.copyWith(color: theme.secondaryHeaderColor),
          ),
          Container(height: 2),
          Text(
            re.type.toCapitalized(),
            style: textTheme.headline5,
          ),
          Container(height: 2),
          Text(
            re.shortAddress,
            style: textTheme.headline6,
            softWrap: false,
            overflow: TextOverflow.fade,
          ),
          Container(height: 4),
          Text(
            _getExtraInfo(re),
            style: textTheme.subtitle2,
          ),
          Container(height: 6),
          Text(
            _nFormat.format(re.price).replaceAll('K', '.000'),
            style: textTheme.headline5.copyWith(color: theme.secondaryHeaderColor),
          ),
        ],
      ),
    );
  }

  String _getExtraInfo(RealEstateListItem re) {
    int count = 0;
    int max = 2;
    String result = '';
    if (re.sqrSpace != null) {
      result += '${re.sqrSpace}$sqrSpaceSymbol';
      count++;
      if (count >= max) {
        return result;
      }
    }
    if (re.bedrooms != null) {
      result += result.isNotEmpty ? ', ' : '';
      result += '${re.bedrooms} bedrooms';
      count++;
      if (count >= max) {
        return result;
      }
    }
    if (re.bathrooms != null) {
      result += result.isNotEmpty ? ', ' : '';
      result += '${re.bathrooms} bathrooms';
      count++;
      if (count >= max) {
        return result;
      }
    }
    if (re.parkingSlots != null) {
      result += result.isNotEmpty ? ', ' : '';
      result += '${re.parkingSlots} parking slots';
      count++;
      if (count >= max) {
        return result;
      }
    }
    return '';
  }

  Widget _buildThumbnail(RealEstateListItem re) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: CustomNetworkImage(imageUrl: re.thumbnail),
      ),
    );
  }
}

extension CapExtension on String {
  String toCapitalized() => '${this[0].toUpperCase()}${this.substring(1)}';
}
