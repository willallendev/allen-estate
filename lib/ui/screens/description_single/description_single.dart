import 'package:allenrealestateflutter/ui/utils/app_bar_generators.dart';
import 'package:allenrealestateflutter/ui/view_models/bars_elevation_view_model/bars_elevation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DescriptionSingleScreen extends StatelessWidget {
  final String appBarTitle;
  final String body;
  final String title;

  DescriptionSingleScreen({this.appBarTitle = '', @required this.body, @required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return ListenableProvider(
      create: (_) => BarsElevationViewModel(),
      builder: (context, _) => Scaffold(
        appBar: generateSimpleAppBar(
          titleSpacing: 0,
          title: appBarTitle,
          context: context,
          elevation: context.watch<BarsElevationViewModel>().topAppBarElevation,
        ),
        backgroundColor: theme.backgroundColor,
        body: ListView(
          controller: context.watch<BarsElevationViewModel>().scrollController,
          children: [
            Container(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(title, style: textTheme.headline6.copyWith(color: theme.primaryColor)),
            ),
            Container(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(body, style: textTheme.bodyText1),
            ),
          ],
        ),
      ),
    );
  }
}
