import 'package:allenrealestateflutter/ui/settings/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// TODO: this components knows too much, refactor to make it dumb
class CustomBottomNavigationBar extends StatelessWidget {
  static const tag = 'CustomBottomNavigationBar';
  final double elevation;
  final int currentIndex;

  CustomBottomNavigationBar({this.elevation, this.currentIndex});

  void _onTap(BuildContext context, int index) {
    if (currentIndex != index) {
      if (index == 0) {
        ExtendedNavigator.of(context).push(Routes.home);
      } else if (index == 1) {
        ExtendedNavigator.of(context).push(Routes.aboutUs);
      } else {
        Scaffold.of(context).showSnackBar(_buildSnackBar());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BottomNavigationBar(
      elevation: elevation ?? 5,
      currentIndex: currentIndex,
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

  Widget _buildWarningIcon() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FaIcon(
          FontAwesomeIcons.exclamationTriangle,
          color: Colors.deepOrange,
          size: 16,
        ),
      );

  Widget _buildLaptopIcon() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FaIcon(
          FontAwesomeIcons.laptopCode,
          color: Colors.deepOrange,
          size: 16,
        ),
      );

  Widget _buildSnackBar() => SnackBar(
          content: Row(
        children: <Widget>[
          _buildWarningIcon(),
          _buildLaptopIcon(),
          Text(
            '  Under development  ',
            textAlign: TextAlign.center,
          ),
          _buildLaptopIcon(),
          _buildWarningIcon(),
        ],
      ));
}
