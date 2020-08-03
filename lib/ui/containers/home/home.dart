import 'package:allenrealestateflutter/core/view_models/home_view_model/home_view_model.dart';
import 'package:allenrealestateflutter/ui/containers/base_container/base_container.dart';
import 'package:allenrealestateflutter/ui/screens/home/home.dart';
import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseContainer<HomeViewModel>(
      builder: (BuildContext context, HomeViewModel model, Widget child) {
        return HomePage(
          reCategoryList: model.homeData.data.reCategoryList,
          reList: model.homeData.data.popularReList,
          state: model.homeData?.state,
        );
      },
    );
  }
}
