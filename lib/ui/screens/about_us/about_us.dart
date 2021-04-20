import 'package:allenrealestateflutter/ui/view_models/bars_elevation_view_model/bars_elevation_view_model.dart';
import 'package:allenrealestateflutter/ui/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:allenrealestateflutter/ui/widgets/custom_network_image/custom_network_image.dart';
import 'package:allenrealestateflutter/ui/widgets/info_map/info_map.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;
import 'package:flutter_signin_button/flutter_signin_button.dart';

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
    final Uri _emailLaunchUri = Uri(
        scheme: 'mailto',
        path: _email,
        queryParameters: {'subject': 'Allen-Real-Estate-Mobile-App'});
    urlLauncher.launch(_emailLaunchUri.toString());
  }

  launchURL(String url) async {
    if (await urlLauncher.canLaunch(url)) {
      await urlLauncher.launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return ListenableProvider<BarsElevationViewModel>(
      create: (_) => BarsElevationViewModel(),
      builder: (context, child) => Scaffold(
        backgroundColor: theme.backgroundColor,
        bottomNavigationBar: CustomBottomNavigationBar(
          onNavigateToHome: onNavigateToHome,
          onNavigateToWhereToFindUs: onNavigateToWhereToFindUs,
          elevation:
              context.watch<BarsElevationViewModel>().bottomAppBarElevation,
          selection: BottomNavBarSelection.aboutUs,
        ),
        body: Theme(
          data: theme.copyWith(accentColor: theme.backgroundColor),
          child: _buildContent(textTheme, theme),
        ),
      ),
    );
  }

  Widget _buildContent(TextTheme textTheme, ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.teal, Colors.grey],
              begin: Alignment(0, 0),
              end: FractionalOffset.bottomCenter)),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 175,
            pinned: false,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.teal],
                      begin: Alignment(0, 0),
                      end: FractionalOffset.bottomCenter)),
              child: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        height: 140,
                        width: 140,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CustomNetworkImage(
                          imageUrl:
                              'https://pbs.twimg.com/profile_images/1167461348684566530/p8mse0BI_400x400.jpg',
                          backgroundColor: Colors.grey,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Text(
                              _fullName,
                              style: textTheme.headline5
                                  .copyWith(color: theme.primaryColor),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 25,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ProfileDetail(
                                  title: Text(_title),
                                  icon: Icon(Icons.card_travel_sharp)),
                              Divider(
                                color: Colors.teal,
                              ),
                              ProfileDetail(
                                  title: GestureDetector(
                                    onTap: _onEmailTap,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Container(
                                        child: Text(
                                          _email,
                                        ),
                                      ),
                                    ),
                                  ),
                                  icon: Icon(Icons.email)),
                              Divider(
                                color: Colors.teal,
                              ),
                              ProfileDetail(
                                  title: Text("Venezuela"),
                                  icon: Icon(Icons.location_city)),
                              Divider(
                                color: Colors.teal,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SignInButton(
                                    Buttons.LinkedIn,
                                    onPressed: () {
                                      String url = 'https://linkedin.com';
                                      launchURL(url);
                                    },
                                    mini: true,
                                  ),
                                  SignInButton(
                                    Buttons.GitHub,
                                    onPressed: () {
                                      String url = 'https://github.com';
                                      launchURL(url);
                                    },
                                    mini: true,
                                  ),
                                  SignInButton(Buttons.Twitter, mini: true,
                                      onPressed: () {
                                    String url = 'https://twitter.com';
                                    launchURL(url);
                                  }),
                                  SignInButton(
                                    Buttons.Facebook,
                                    onPressed: () {
                                      String url = 'https://facebook.com';
                                      launchURL(url);
                                    },
                                    mini: true,
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.teal,
                              )
                            ],
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        _profile,
                        style: textTheme.bodyText1,
                      ),
                    ),
                    Container(height: 24),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InfoMap(
                        lat: 8.315160,
                        long: -62.714939,
                        zoomLevel: 3,
                      ),
                    ),
                    //_buildMapFooter(textTheme, theme),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMapFooter(TextTheme textTheme, ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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

class ProfileDetail extends StatelessWidget {
  final Widget title;
  final Icon icon;

  const ProfileDetail({
    Key key,
    @required this.title,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Align(alignment: Alignment.centerLeft, child: icon),
        SizedBox(
          width: 50,
        ),
        Align(alignment: Alignment.center, child: title)
      ],
    );
  }
}
