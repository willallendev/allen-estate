import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum BottomNavBarSelection {
  home,
  aboutUs,
  whereToFindUs,
}

extension _meta on BottomNavBarSelection {
  int toIndex() {
    switch (this) {
      case BottomNavBarSelection.home:
        return 0;
      case BottomNavBarSelection.aboutUs:
        return 1;
      case BottomNavBarSelection.whereToFindUs:
        return 2;
    }
    return 0;
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  static const tag = 'CustomBottomNavigationBar';
  final double elevation;
  final BottomNavBarSelection selection;
  final void Function() onNavigateToHome;
  final void Function() onNavigateToAboutUs;
  final void Function() onNavigateToWhereToFindUs;

  CustomBottomNavigationBar({
    this.elevation,
    this.selection,
    this.onNavigateToHome,
    this.onNavigateToAboutUs,
    this.onNavigateToWhereToFindUs,
  });

  void _onTap(BuildContext context, int index) {
    if (selection.toIndex() != index) {
      if (index == 0) {
        onNavigateToHome?.call();
      } else if (index == 1) {
        onNavigateToAboutUs?.call();
      } else {
        onNavigateToWhereToFindUs?.call();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BottomNavigationBar(
      elevation: elevation ?? 5,
      currentIndex: selection.toIndex(),
      backgroundColor: theme.backgroundColor,
      selectedItemColor: theme.primaryColor,
      unselectedItemColor: theme.textTheme.bodyText1.color,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) => _onTap(context, index),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.solidAddressCard),
          title: Text('Contact'),
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.mapMarkedAlt),
          title: Text('Find Us'),
        ),
      ],
    );
  }
}
