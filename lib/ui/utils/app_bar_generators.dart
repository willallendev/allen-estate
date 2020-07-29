import 'package:flutter/material.dart';

AppBar generateIdleSearchAppBar({@required BuildContext context, Function onTap}) {
  final theme = Theme.of(context);
  final textTheme = theme.textTheme;
  final dimmedFontColor = textTheme.bodyText1.color;
  return AppBar(
    title: Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.all(Radius.circular(24)),
      color: theme.backgroundColor,
      child: Container(
        height: 48,
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: <Widget>[
              Icon(Icons.search, color: dimmedFontColor),
              Container(width: 16),
              Text('Search', style: textTheme.headline6.copyWith(color: dimmedFontColor)),
            ],
          ),
        ),
      ),
    ),
  );
}
