import 'package:flutter/material.dart';

class InfoIcon extends StatelessWidget {
  final String info;
  final Widget icon;

  InfoIcon({@required this.info, @required this.icon})
      : assert(info != null, '"info" param cannot be null'),
        assert(icon != null, '"icon" param cannot be null');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      constraints: BoxConstraints(
        maxWidth: 64,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          icon,
          Container(height: 4),
          Text(
            info,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: TextStyle(
              color: theme.textTheme.headline1.color,
            ),
          ),
        ],
      ),
    );
  }
}
