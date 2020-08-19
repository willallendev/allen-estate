import 'package:allenrealestateflutter/ui/utils/app_bar_generators.dart';
import 'package:allenrealestateflutter/ui/view_models/bars_elevation_view_model/bars_elevation_view_model.dart';
import 'package:allenrealestateflutter/ui/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:allenrealestateflutter/ui/widgets/custom_network_image/custom_network_image.dart';
import 'package:allenrealestateflutter/ui/widgets/info_map/info_map.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

class AboutUsScreen extends StatelessWidget {
  final void Function() onNavigateToHome;
  final void Function() onNavigateToWhereToFindUs;

  final String _fullName = 'William Allen';
  final String _title = 'Software Developer';
  final String _email = 'allenwilliamdev@gmail.com';
  final String _profile =
      'Passionate and experienced software developer with great enthusiasm for UI/UX. Adept to software architecture and design patterns for more testable and maintainable code. With experience working as part of, and leading, small teams with members of different areas of specialties.';
  final String _address = 'Venezuela';

  AboutUsScreen({this.onNavigateToHome, this.onNavigateToWhereToFindUs});

  void _onEmailTap() {
    final Uri _emailLaunchUri =
        Uri(scheme: 'mailto', path: _email, queryParameters: {'subject': 'Allen-Real-Estate-Mobile-App'});
    urlLauncher.launch(_emailLaunchUri.toString());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return ListenableProvider<BarsElevationViewModel>(
      create: (_) => BarsElevationViewModel(),
      builder: (context, child) => Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: generateSimpleAppBar(
          context: context,
          elevation: context.watch<BarsElevationViewModel>().topAppBarElevation,
          title: 'About us',
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          onNavigateToHome: onNavigateToHome,
          onNavigateToWhereToFindUs: onNavigateToWhereToFindUs,
          elevation: context.watch<BarsElevationViewModel>().bottomAppBarElevation,
          selection: BottomNavBarSelection.aboutUs,
        ),
        body: Theme(
          data: theme.copyWith(accentColor: theme.backgroundColor),
          child: ListView(
            controller: context.watch<BarsElevationViewModel>().scrollController,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: _buildContent(textTheme, theme),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(TextTheme textTheme, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(height: 8),
        Container(
          height: 100,
          width: 100,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: CustomNetworkImage(
            imageUrl: 'https://pbs.twimg.com/profile_images/1167461348684566530/p8mse0BI_400x400.jpg',
            backgroundColor: Colors.grey,
            fit: BoxFit.cover,
          ),
        ),
        Container(height: 16),
        Text(
          _fullName,
          style: textTheme.headline6.copyWith(color: theme.primaryColor),
        ),
        Container(height: 4),
        Text(
          _title,
          style: textTheme.headline6,
        ),
        GestureDetector(
          onTap: _onEmailTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Container(
              width: double.infinity,
              child: Text(
                _email,
                style: textTheme.caption.copyWith(),
              ),
            ),
          ),
        ),
        Container(height: 24),
        Text(
          _profile,
          style: textTheme.bodyText1,
        ),
        Container(height: 24),
        InfoMap(
          lat: 8.315160,
          long: -62.714939,
          zoomLevel: 3,
        ),
        _buildMapFooter(textTheme, theme),
      ],
    );
  }

  Widget _buildMapFooter(TextTheme textTheme, ThemeData theme) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Text(
            _address,
            style: textTheme.caption.copyWith(color: theme.primaryColor),
          ),
        ),
        Container(
          constraints: BoxConstraints.loose(Size(16, 16)),
          child: CustomNetworkImage(
            fit: BoxFit.contain,
            imageUrl:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Flag-map_of_Venezuela.svg/696px-Flag-map_of_Venezuela.svg.png',
          ),
        ),
      ],
    );
  }
}
