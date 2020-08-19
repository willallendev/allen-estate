import 'package:allenrealestateflutter/core/data_models/async_state.dart';
import 'package:allenrealestateflutter/ui/settings/router/router.gr.dart';
import 'package:allenrealestateflutter/ui/utils/app_bar_generators.dart';
import 'package:allenrealestateflutter/ui/widgets/async_state_manager/async_state_manager.dart';
import 'package:allenrealestateflutter/ui/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  AsyncState _state = AsyncState.loading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    void _setLoading(bool isLoading) {
      setState(() {
        _state = isLoading ? AsyncState.loading : AsyncState.done;
      });
    }

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: generateSimpleAppBar(context: context, title: 'About us', elevation: 0, iconTheme: theme.iconTheme),
      bottomNavigationBar: CustomBottomNavigationBar(
        elevation: 5,
        selection: BottomNavBarSelection.aboutUs,
        onNavigateToHome: () => ExtendedNavigator.of(context).replace(Routes.home),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebView(
            initialUrl: 'https://github.com/willallendev',
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (url) => _setLoading(true),
            onPageFinished: (url) => _setLoading(false),
          ),
          AsyncStateManager(
            state: _state,
            child: Container(),
          )
        ],
      ),
    );
  }
}
