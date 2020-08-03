import 'dart:developer';

import 'package:allenrealestateflutter/core/view_models/home_view_model/home_view_model.dart';
import 'package:allenrealestateflutter/ui/containers/base_container/base_container.dart';
import 'package:allenrealestateflutter/ui/screens/home/home.dart';
import 'package:allenrealestateflutter/ui/utils/re_search_delegate.dart';
import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  static const tag = 'HomeContainer';

  void _onSearch(BuildContext context) async {
    String query = await showSearch<String>(context: context, delegate: ReSearchDelegate());
    log(query ?? 'empty', name: tag);
  }

  @override
  Widget build(BuildContext context) {
    return BaseContainer<HomeViewModel>(
      builder: (BuildContext context, HomeViewModel model, Widget child) {
        return HomeScreen(
          reCategoryList: model.homeData.data.reCategoryList,
          reList: model.homeData.data.popularReList,
          state: model.homeData?.state,
          onSearch: () => _onSearch(context),
        );
      },
    );
  }
}
