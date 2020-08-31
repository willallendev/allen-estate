import 'package:allenrealestateflutter/core/data_models/async_state.dart';
import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/ui/utils/app_bar_generators.dart';
import 'package:allenrealestateflutter/ui/view_models/bars_elevation_view_model/bars_elevation_view_model.dart';
import 'package:allenrealestateflutter/ui/widgets/async_state_manager/async_state_manager.dart';
import 'package:allenrealestateflutter/ui/widgets/carousels/re_carousel/re_carousel.dart';
import 'package:allenrealestateflutter/ui/widgets/carousels/re_category_carousel/re_category_carousel.dart';
import 'package:allenrealestateflutter/ui/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const tag = 'HomeScreen';

class HomeScreen extends StatelessWidget {
  final AsyncState state;
  final List<RealEstateListItem> reList;
  final List<RealEstateCategory> reCategoryList;
  final Function onSearch;
  final void Function() onNavigateToAboutUs;
  final void Function() onNavigateToWhereToFindUs;
  final void Function(RealEstateListItem realEstate) onReCardTap;
  final void Function(RealEstateCategory category) onReCategoryCardTap;
  final void Function() onPopularTap;

  HomeScreen({
    this.state,
    @required this.reList,
    @required this.reCategoryList,
    this.onSearch,
    this.onReCardTap,
    this.onReCategoryCardTap,
    this.onPopularTap,
    this.onNavigateToAboutUs,
    this.onNavigateToWhereToFindUs,
  })  : assert(reList != null, 'reList param must be provided'),
        assert(reCategoryList != null, 'reCategoryList param must be provided');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = theme.primaryColor;

    return ListenableProvider<BarsElevationViewModel>(
      create: (_) => BarsElevationViewModel(),
      builder: (context, _) => Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: generateIdleSearchAppBar(
              context: context, onTap: onSearch, elevation: context.watch<BarsElevationViewModel>().topAppBarElevation),
          bottomNavigationBar: CustomBottomNavigationBar(
            elevation: context.watch<BarsElevationViewModel>().bottomAppBarElevation,
            onNavigateToAboutUs: onNavigateToAboutUs,
            onNavigateToWhereToFindUs: onNavigateToWhereToFindUs,
            selection: BottomNavBarSelection.home,
          ),
          body: AsyncStateManager(
            state: state,
            builder: (BuildContext context) => Theme(
              data: theme.copyWith(accentColor: Colors.white),
              child: ListView(
                controller: context.watch<BarsElevationViewModel>().scrollController,
                children: <Widget>[
                  Container(height: 6),
                  _buildHPadding(
                    child: Text('Find your home', style: textTheme.headline3.copyWith(color: primaryColor)),
                  ),
                  Container(height: 24),
                  _buildHPadding(
                    child: GestureDetector(
                      onTap: onPopularTap,
                      child: Text('Popular', style: textTheme.headline5.copyWith(color: primaryColor)),
                    ),
                  ),
                  Container(height: 16),
                  ReCarousel(realEstateList: reList, onTap: onReCardTap),
                  Container(height: 32),
                  _buildHPadding(
                    child: Text('Categories', style: textTheme.headline5.copyWith(color: primaryColor)),
                  ),
                  Container(height: 16),
                  ReCategoryCarousel(categoryList: reCategoryList, onTap: onReCategoryCardTap),
                  Container(height: 16),
                ],
              ),
            ),
          )),
    );
  }

  Widget _buildHPadding({@required Widget child, double padding = 16}) {
    return Padding(
      padding: EdgeInsets.only(left: padding),
      child: child,
    );
  }
}
