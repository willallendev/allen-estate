import 'package:allenrealestateflutter/ui/utils/app_bar_generators.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: generateSimpleAppBar(context: context, title: 'About us', elevation: 0, iconTheme: theme.iconTheme),
	    body: ,
    );
  }
}
