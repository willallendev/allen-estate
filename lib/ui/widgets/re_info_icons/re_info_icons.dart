import 'package:allenrealestateflutter/ui/widgets/info_icon/info_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReInfoIcons extends StatelessWidget {
  final int sqrSpace;
  final String spaceUnits;
  final int bedrooms;
  final int bathrooms;
  final int parkingSlots;

  ReInfoIcons({
    this.sqrSpace,
    this.spaceUnits = 'm²',
    this.bedrooms,
    this.bathrooms,
    this.parkingSlots,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _nullHidder(
          value: sqrSpace,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: InfoIcon(info: '$sqrSpace$spaceUnits', icon: FaIcon(FontAwesomeIcons.ruler)),
          ),
        ),
        _nullHidder(
          value: bedrooms,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: InfoIcon(info: '$bedrooms', icon: FaIcon(FontAwesomeIcons.bed)),
          ),
        ),
        _nullHidder(
          value: bathrooms,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: InfoIcon(info: '$bathrooms', icon: FaIcon(FontAwesomeIcons.bath)),
          ),
        ),
        _nullHidder(
          value: parkingSlots,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: InfoIcon(info: '$parkingSlots', icon: FaIcon(FontAwesomeIcons.carAlt)),
          ),
        ),
      ],
    );
  }

  Widget _nullHidder({@required value, @required child}) {
    return value != null ? child : Container();
  }
}
