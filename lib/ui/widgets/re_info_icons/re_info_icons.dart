import 'package:allenrealestateflutter/ui/widgets/info_icon/info_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum InfoIconsLayout { column, row }

class InfoIconsConfig {
  final InfoIconsLayout layout;
  final double iconSize;
  final double fontSize;
  final double textIconSpace;
  final double gap;
  final String sqrSpaceSymbol;

  InfoIconsConfig({this.layout, this.iconSize, this.fontSize, this.textIconSpace, this.gap, this.sqrSpaceSymbol});

  const InfoIconsConfig.defaultConfig({
    this.layout = InfoIconsLayout.column,
    this.iconSize = 12,
    this.fontSize = 10,
    this.textIconSpace = 2,
    this.gap = 4,
    this.sqrSpaceSymbol = 'm²',
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
    final c = config;
    return _buildLayout(layout: c.layout, children: <Widget>[
      _buildNullHidder(
        value: sqrSpace,
        child: InfoIcon(
          info: '$sqrSpace${c.sqrSpaceSymbol}',
          icon: FaIcon(FontAwesomeIcons.ruler, size: c.iconSize),
          fontSize: c.fontSize,
          textIconSpace: c.textIconSpace,
        ),
      ),
      _buildSpacer(layout: c.layout, size: c.gap),
      _buildNullHidder(
        value: bedrooms,
        child: InfoIcon(
          info: '$bedrooms',
          icon: FaIcon(FontAwesomeIcons.bed, size: c.iconSize),
          fontSize: c.fontSize,
          textIconSpace: c.textIconSpace,
        ),
      ),
      _buildSpacer(layout: c.layout, size: c.gap),
      _buildNullHidder(
        value: bathrooms,
        child: InfoIcon(
          info: '$bathrooms',
          icon: FaIcon(FontAwesomeIcons.shower, size: c.iconSize),
          fontSize: c.fontSize,
          textIconSpace: c.textIconSpace,
        ),
      ),
      _buildSpacer(layout: c.layout, size: c.gap),
      _buildNullHidder(
        value: parkingSlots,
        child: InfoIcon(
          info: '$parkingSlots',
          icon: FaIcon(FontAwesomeIcons.carAlt, size: c.iconSize),
          fontSize: c.fontSize,
          textIconSpace: c.textIconSpace,
        ),
      ),
    ]);
  }

  Widget _buildNullHidder({@required value, @required child}) {
    return value != null ? child : Container();
  }

  // ignore: missing_return
  Widget _buildLayout({InfoIconsLayout layout, List<Widget> children}) {
    switch (layout) {
      case InfoIconsLayout.column:
        return Column(children: children);
      case InfoIconsLayout.row:
        return Row(children: children);
    }
  }

  // ignore: missing_return
  Widget _buildSpacer({InfoIconsLayout layout, double size}) {
    switch (layout) {
      case InfoIconsLayout.column:
        return Container(height: size);
      case InfoIconsLayout.row:
        return Container(width: size);
    }
  }
}
