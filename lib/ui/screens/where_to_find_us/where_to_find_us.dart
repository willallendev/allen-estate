import 'package:allenrealestateflutter/core/data_models/async_state.dart';
import 'package:allenrealestateflutter/ui/utils/app_bar_generators.dart';
import 'package:allenrealestateflutter/ui/widgets/async_state_manager/async_state_manager.dart';
import 'package:allenrealestateflutter/ui/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WhereToFindUsScreen extends StatefulWidget {
  final void Function() onNavigateToHome;
  final void Function() onNavigateToAboutUs;
  final String url;

  WhereToFindUsScreen({this.onNavigateToHome, this.onNavigateToAboutUs, this.url});

  @override
  _WhereToFindUsScreenState createState() => _WhereToFindUsScreenState();
}

class _WhereToFindUsScreenState extends State<WhereToFindUsScreen> {
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
      appBar: generateSimpleAppBar(context: context, title: 'Where to find us', elevation: 0, iconTheme: theme.iconTheme),
      bottomNavigationBar: CustomBottomNavigationBar(
        elevation: 5,
        selection: BottomNavBarSelection.whereToFindUs,
        onNavigateToHome: widget.onNavigateToHome,
        onNavigateToAboutUs: widget.onNavigateToAboutUs,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (url) => _setLoading(true),
            onPageFinished: (url) => _setLoading(false),
          ),
          AsyncStateManager(
            state: _state,
            builder: (context) => Container(),
          )
        ],
      ),
    );
  }
}
