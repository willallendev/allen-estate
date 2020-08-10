import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:flutter/material.dart';

class ReCategoryCard extends StatelessWidget {
  final RealEstateCategory category;
  final void Function(RealEstateCategory category) onTap;

  ReCategoryCard({this.category, this.onTap}) : assert(category != null);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return GestureDetector(
      onTap: () => onTap?.call(category),
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Card(
                color: theme.cardColor,
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Image.asset(category.image),
                ),
              ),
            ),
            Container(height: 8),
            Text(
              category.name,
              style: textTheme.subtitle2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
