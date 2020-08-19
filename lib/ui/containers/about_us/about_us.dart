import 'package:allenrealestateflutter/ui/screens/about_us/about_us.dart';
import 'package:allenrealestateflutter/ui/settings/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AboutUsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AboutUsScreen(
      onNavigateToHome: () => ExtendedNavigator.of(context).replace(Routes.home),
      onNavigateToWhereToFindUs: () => ExtendedNavigator.of(context).replace(Routes.whereToFindUs),
    );
  }
}
