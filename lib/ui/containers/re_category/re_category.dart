import 'package:allenrealestateflutter/ui/screens/under_development/under_development.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';

class ReCategoryContainer extends StatelessWidget {
  static const String tag = 'ReCategoryContainer';
  final String id;

  ReCategoryContainer({
    @required @PathParam('categoryId') this.id,
  });

  @override
  Widget build(BuildContext context) {
    return UnderDevelopmentScreen(
      title: '$tag: \nid: $id',
    );
  }
}
