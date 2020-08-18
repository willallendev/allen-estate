import 'package:allenrealestateflutter/core/view_models/re_single/re_single.dart';
import 'package:allenrealestateflutter/ui/containers/base_container/base_container.dart';
import 'package:allenrealestateflutter/ui/screens/re_single/re_single.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';

class ReSingleContainer extends StatelessWidget {
  static const tag = 'ReSingleContainer';
  final String id;

  ReSingleContainer({
    @required @PathParam() this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      onModelReady: (ReSingleViewModel model) {
        model.getSingleData(id);
      },
      builder: (BuildContext context, ReSingleViewModel model, Widget child) {
        return ReEstateSingleScreen(
          state: model.mainState.state,
          realEstate: model.mainState.data?.realEstate,
          carouselRealEstateList: model.mainState.data?.carouselData,
        );
      },
    );
  }
}
