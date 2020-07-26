import 'package:allenrealestateflutter/core/models/real_estate.dart';
import 'package:allenrealestateflutter/ui/widgets/cards/re_card/re_card.dart';
import 'package:flutter/material.dart';

class ReCarousel extends StatelessWidget {
  final List<RealEstateListItem> realEstateList;
  final double sidePadding;

  ReCarousel({this.realEstateList, this.sidePadding = 16})
      : assert(realEstateList != null),
        assert(sidePadding != null),
        assert(sidePadding.isFinite),
        assert(!sidePadding.isNegative),
        assert(!sidePadding.isNaN);

  Widget _cardBuilder(BuildContext context, int index) {
    Widget cardWidget = ReCard(realEstate: realEstateList[index]);
    const double gap = 40;

    if (realEstateList[index] == realEstateList.first) {
      return Padding(
        padding: EdgeInsets.only(left: sidePadding, right: gap / 2),
        child: cardWidget,
      );
    } else if (realEstateList[index] == realEstateList.last) {
      return Padding(
        padding: EdgeInsets.only(right: sidePadding, left: gap / 2),
        child: cardWidget,
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: gap / 2),
      child: cardWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ReCard.height,
      child: ListView.builder(
        itemCount: realEstateList.length,
        itemBuilder: _cardBuilder,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
