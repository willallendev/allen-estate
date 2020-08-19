import 'package:flutter/material.dart';

AppBar generateIdleSearchAppBar({@required BuildContext context, Function onTap, double elevation}) {
  final theme = Theme.of(context);
  final textTheme = theme.textTheme;
  final dimmedFontColor = textTheme.bodyText1.color;
  return AppBar(
    elevation: elevation ?? 5,
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

AppBar generateResultsSearchAppBar(
    {@required BuildContext context, String title, Function onSearch, Function onFilter, double elevation}) {
  final theme = Theme.of(context);
  final textTheme = theme.textTheme;
  final fontColor = textTheme.headline1.color;
  return AppBar(
    iconTheme: theme.iconTheme.copyWith(color: fontColor),
    automaticallyImplyLeading: true,
    elevation: elevation ?? 5,
    actions: [
      IconButton(
        splashRadius: 24,
        icon: Icon(Icons.search, color: fontColor),
        onPressed: onSearch,
      ),
//      IconButton(
//        splashRadius: 24,
//        icon: SvgPicture.asset('lib/ui/assets/icons/ic_filter.svg', color: fontColor),
//        onPressed: onFilter,
//      ),
    ],
    title: Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.all(Radius.circular(24)),
      color: theme.backgroundColor,
      child: Container(
        height: 48,
        child: InkWell(
          onTap: onSearch,
          child: Row(
            children: <Widget>[
              Text(title, style: textTheme.bodyText1.copyWith(color: fontColor)),
            ],
          ),
        ),
      ),
    ),
  );
}

AppBar generateSimpleAppBar({
  @required BuildContext context,
  String title,
  double elevation,
  Color backgroundColor,
  TextStyle textStyle,
  IconThemeData iconTheme,
  double titleSpacing = 16,
}) {
  final theme = Theme.of(context);
  final _textTheme = theme.textTheme;
  final _iconTheme = theme.iconTheme;

  return AppBar(
    elevation: elevation ?? 0,
    titleSpacing: titleSpacing,
    iconTheme: iconTheme ?? _iconTheme,
    backgroundColor: backgroundColor ?? theme.backgroundColor,
    title: Text(
      title != null ? title.toCapitalized() : title,
      style: textStyle ?? _textTheme.caption,
      overflow: TextOverflow.fade,
    ),
    automaticallyImplyLeading: true,
  );
}

extension _CapExtension on String {
  String toCapitalized() => '${this[0].toUpperCase()}${this.substring(1)}';
}
