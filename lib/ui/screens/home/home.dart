import 'dart:developer';

import 'package:allenrealestateflutter/core/mock/real_estate.dart' as reMock;
import 'package:allenrealestateflutter/ui/utils/app_bar_generators.dart';
import 'package:allenrealestateflutter/ui/widgets/carousels/re_carousel/re_carousel.dart';
import 'package:flutter/material.dart';

const tag = 'HomePage';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = theme.primaryColor;

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: generateIdleSearchAppBar(
          context: context,
          onTap: () => log('on tap', name: '$tag/appBar'),
        ),
        body: Theme(
          data: theme.copyWith(accentColor: Colors.white),
          child: ListView(
            primary: true,
            children: <Widget>[
              Container(height: 6),
              _buildHPadding(
                child: Text('Find your home', style: textTheme.headline3.copyWith(color: primaryColor)),
              ),
              Container(height: 24),
              _buildHPadding(
                child: Text('Popular', style: textTheme.headline5.copyWith(color: primaryColor)),
              ),
              Container(height: 16),
              ReCarousel(realEstateList: reMock.listItemList),
              Container(height: 32),
              _buildHPadding(
                child: Text('Categories', style: textTheme.headline5.copyWith(color: primaryColor)),
              ),
              Container(height: 16),
            ],
          ),
        ));
  }

  Widget _buildHPadding({@required Widget child, double padding = 16}) {
    return Padding(
      padding: EdgeInsets.only(left: padding),
      child: child,
    );
  }
}
