import 'dart:developer';

import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/core/view_models/home_view_model/home_view_model.dart';
import 'package:allenrealestateflutter/ui/containers/base_container/base_container.dart';
import 'package:allenrealestateflutter/ui/screens/home/home.dart';
import 'package:allenrealestateflutter/ui/settings/router/router.gr.dart';
import 'package:allenrealestateflutter/ui/utils/re_search_delegate.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  static const String tag = 'HomeContainer';

  void _onSearch(BuildContext context) async {
    String query = await showSearch<String>(context: context, delegate: ReSearchDelegate());
    if (query != null) {
      ExtendedNavigator.of(context).push(
        Routes.reSearchResults,
        queryParams: {'query': query},
      );
    }
  }

  void _onReCardNavigate(BuildContext context, RealEstateListItem realEstate) {
    if (realEstate?.id != null) {
      ExtendedNavigator.of(context).push(
        Routes.reSingle(id: realEstate.id),
      );
    } else {
      log('Error, corrupted item, item.id == null', name: '$tag/_onReCardNavigate');
    }
  }

  void _onReCategoryCardNavigate(BuildContext context, RealEstateCategory category) {
    if (category?.id != null) {
      ExtendedNavigator.of(context).push(Routes.reCategory(categoryId: category.id));
    } else {
      log('Error, corrupted item, item.id == null', name: '$tag/_onReCategoryCardNavigate');
    }
  }

  void _onPopularNavigate(BuildContext context) {
//    ExtendedNavigator.of(context).push(Routes.rePopularList);
  }

  @override
  Widget build(BuildContext context) {
    return BaseContainer<HomeViewModel>(
      onModelReady: (HomeViewModel model) {
        model.init();
      },
      builder: (BuildContext context, HomeViewModel model, Widget child) {
        return HomeScreen(
          reCategoryList: model.mainState.data.reCategoryList,
          reList: model.mainState.data.popularReList,
          state: model.mainState?.state,
          onRetry: model.init,
          onSearch: () => _onSearch(context),
          onReCardTap: (realEstate) => _onReCardNavigate(context, realEstate),
          onReCategoryCardTap: (category) => _onReCategoryCardNavigate(context, category),
          onPopularTap: () => _onPopularNavigate(context),
          onNavigateToWhereToFindUs: () => ExtendedNavigator.of(context).replace(Routes.whereToFindUs),
          onNavigateToAboutUs: () => ExtendedNavigator.of(context).replace(Routes.aboutUs),
        );
      },
    );
  }
}
