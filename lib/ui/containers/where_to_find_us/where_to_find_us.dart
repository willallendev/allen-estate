import 'package:allenrealestateflutter/ui/screens/where_to_find_us/where_to_find_us.dart';
import 'package:allenrealestateflutter/ui/settings/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class WhereToFindUsContainer extends StatelessWidget {
  void _onNavigateHome(BuildContext context) {
    ExtendedNavigator.of(context).replace(Routes.home);
  }

  void _onNavigateAboutUs(BuildContext context) {
    ExtendedNavigator.of(context).replace(Routes.aboutUs);
  }

  @override
  Widget build(BuildContext context) {
    return WhereToFindUsScreen(
      url: 'https://github.com/willallendev',
      onNavigateToHome: () => _onNavigateHome(context),
      onNavigateToAboutUs: () => _onNavigateAboutUs(context),
    );
  }
}
