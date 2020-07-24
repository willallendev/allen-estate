import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoIcon extends StatelessWidget {
  final String info;
  final double fontSize;
  final double textIconSpace;
  final FaIcon icon;

  InfoIcon({
    @required this.info,
    this.fontSize = 10,
    this.textIconSpace = 2,
    @required this.icon,
  })  : assert(info != null, '"info" param cannot be null'),
        assert(icon != null, '"icon" param cannot be null'),
        assert(fontSize != null, '"fontSize" param cannot be null'),
        assert(textIconSpace != null, '"textIconSpace" param cannot be null');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          icon,
          Container(height: textIconSpace),
          Text(
            info,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: TextStyle(
              color: theme.textTheme.headline1.color,
              fontWeight: FontWeight.w500,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
