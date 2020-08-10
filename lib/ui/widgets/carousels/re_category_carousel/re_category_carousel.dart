import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/ui/widgets/cards/re_category_card/re_category_card.dart';
import 'package:flutter/material.dart';

class ReCategoryCarousel extends StatelessWidget {
  final List<RealEstateCategory> categoryList;
  final void Function(RealEstateCategory category) onTap;
  final double sidePadding;

  ReCategoryCarousel({@required this.categoryList, this.sidePadding = 16, this.onTap})
      : assert(categoryList != null, 'categoryList param must be provided'),
        assert(sidePadding != null, 'sidePadding param must be provided'),
        assert(sidePadding.isFinite),
        assert(!sidePadding.isNegative),
        assert(!sidePadding.isNaN);

  Widget _cardBuilder(BuildContext context, int index) {
    Widget cardWidget = ReCategoryCard(category: categoryList[index], onTap: onTap);
    const double gap = 24;

    if (categoryList[index] == categoryList.first) {
      return Padding(
        padding: EdgeInsets.only(left: sidePadding, right: gap / 2),
        child: cardWidget,
      );
    } else if (categoryList[index] == categoryList.last) {
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
      height: 104,
      child: ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: _cardBuilder,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
