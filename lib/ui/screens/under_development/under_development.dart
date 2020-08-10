import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UnderDevelopmentScreen extends StatelessWidget {
  final String title;

  UnderDevelopmentScreen({this.title = ''});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        iconTheme: theme.iconTheme,
        automaticallyImplyLeading: true,
      ),
      backgroundColor: theme.backgroundColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title ?? '',
              textAlign: TextAlign.center,
              style: textTheme.headline6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildWarningIcon(),
                _buildLaptopIcon(),
                Text(
                  '  Under development  ',
                  style: textTheme.subtitle1,
                ),
                _buildLaptopIcon(),
                _buildWarningIcon(),
              ],
            ),
            Container(height: 80),
          ],
        ),
      ),
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
}
