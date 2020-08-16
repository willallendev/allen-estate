import 'package:allenrealestateflutter/ui/widgets/info_icon/info_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum InfoIconsLayout { column, row }

class InfoIconsConfig {
  final InfoIconsLayout layout;
  final double iconSize;
  final double fontSize;
  final double textIconSpace;
  final String sqrSpaceSymbol;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;

  InfoIconsConfig(this.mainAxisAlignment, this.crossAxisAlignment, this.mainAxisSize,
      {this.layout, this.iconSize, this.fontSize, this.textIconSpace, this.sqrSpaceSymbol});

  const InfoIconsConfig.defaultConfig({
    this.layout = InfoIconsLayout.column,
    this.iconSize = 12,
    this.fontSize = 10,
    this.textIconSpace = 2,
    this.sqrSpaceSymbol = 'm²',
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });
}

class ReInfoIcons extends StatelessWidget {
  final int sqrSpace;
  final int bedrooms;
  final int bathrooms;
  final int parkingSlots;
  final InfoIconsConfig config;

  ReInfoIcons(
      {this.sqrSpace, this.bedrooms, this.bathrooms, this.parkingSlots, this.config = const InfoIconsConfig.defaultConfig()});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final c = config;
    List<Widget> infoIcons = [];
    if (sqrSpace != null) {
      infoIcons.add(
        InfoIcon(
          info: '$sqrSpace${c.sqrSpaceSymbol}',
          icon: FaIcon(FontAwesomeIcons.ruler, size: c.iconSize, color: textTheme.headline1.color),
          fontSize: c.fontSize,
          textIconSpace: c.textIconSpace,
        ),
      );
    }

    if (bedrooms != null) {
      infoIcons.add(
        InfoIcon(
          info: '$bedrooms',
          icon: FaIcon(FontAwesomeIcons.bed, size: c.iconSize, color: textTheme.headline1.color),
          fontSize: c.fontSize,
          textIconSpace: c.textIconSpace,
        ),
      );
    }

    if (bedrooms != null) {
      infoIcons.add(
        InfoIcon(
          info: '$bathrooms',
          icon: FaIcon(FontAwesomeIcons.shower, size: c.iconSize, color: textTheme.headline1.color),
          fontSize: c.fontSize,
          textIconSpace: c.textIconSpace,
        ),
      );
    }

    if (parkingSlots != null) {
      infoIcons.add(
        InfoIcon(
          info: '$parkingSlots',
          icon: FaIcon(FontAwesomeIcons.carAlt, size: c.iconSize, color: textTheme.headline1.color),
          fontSize: c.fontSize,
          textIconSpace: c.textIconSpace,
        ),
      );
    }

    return _buildLayout(layout: c.layout, children: infoIcons);
  }

  // ignore: missing_return
  Widget _buildLayout({InfoIconsLayout layout, List<Widget> children}) {
    switch (layout) {
      case InfoIconsLayout.column:
        return Column(
          children: children,
          mainAxisAlignment: config.mainAxisAlignment,
          mainAxisSize: config.mainAxisSize,
          crossAxisAlignment: config.crossAxisAlignment,
        );
      case InfoIconsLayout.row:
        return Row(
          children: children,
          mainAxisAlignment: config.mainAxisAlignment,
          mainAxisSize: config.mainAxisSize,
          crossAxisAlignment: config.crossAxisAlignment,
        );
    }
  }
}
