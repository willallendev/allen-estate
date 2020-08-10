import 'package:allenrealestateflutter/ui/screens/under_development/under_development.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';

class ReSearchResultsContainer extends StatelessWidget {
  static const tag = 'ReSearchResultsContainer';
  final String query;

  ReSearchResultsContainer({
    @required @QueryParam() this.query,
  });

  @override
  Widget build(BuildContext context) {
    return UnderDevelopmentScreen(title: 'ReSearchResultsContainer: $query');
  }
}
