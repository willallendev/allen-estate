import 'package:allenrealestateflutter/ui/screens/under_development/under_development.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';

class ReSingleContainer extends StatelessWidget {
  static const tag = 'ReSingleContainer';
  final String id;

  ReSingleContainer({
    @required @PathParam() this.id,
  });

  @override
  Widget build(BuildContext context) {
    return UnderDevelopmentScreen(
      title: '$tag: \nid: $id',
    );
  }
}
