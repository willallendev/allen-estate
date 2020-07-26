import 'dart:developer';

import 'package:allenrealestateflutter/core/models/real_estate.dart';
import 'package:allenrealestateflutter/ui/utils/app_bar_generators.dart';
import 'package:allenrealestateflutter/ui/widgets/cards/re_card/re_card.dart';
import 'package:flutter/material.dart';

const tag = 'HomePage';

class HomePage extends StatelessWidget {
  final RealEstateListItem item = RealEstateListItem(
    id: 'test-re-1',
    dealType: 'for rent',
    type: 'apartment',
    shortAddress: 'London - Stratford',
    price: 1260000,
//    thumbnail: 'https://i.pinimg.com/originals/ba/61/cc/ba61cc38f919bbfb8f7cbac8a6b3a434.jpg',
    thumbnail: 'https://assets.reapit.net/stp/live/pictures/LKN/16/LKN160069_06.jpg',
    bathrooms: 4,
    bedrooms: 3,
    parkingSlots: 2,
    sqrSpace: 80,
  );

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
              SizedBox(
                height: 496,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(width: 16),
                    ReCard(realEstate: item),
                    Container(width: 40),
                    ReCard(realEstate: item),
                    Container(width: 40),
                    ReCard(realEstate: item),
                    Container(width: 16),
                  ],
                ),
              ),
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
