import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      IconButton(
        splashRadius: 24,
        icon: SvgPicture.asset('lib/ui/assets/icons/ic_filter.svg', color: fontColor),
        onPressed: onFilter,
      ),
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
