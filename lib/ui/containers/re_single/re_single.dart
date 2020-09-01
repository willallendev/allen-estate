import 'dart:developer';

import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/core/view_models/re_single/re_single.dart';
import 'package:allenrealestateflutter/ui/containers/base_container/base_container.dart';
import 'package:allenrealestateflutter/ui/screens/re_single/re_single.dart';
import 'package:allenrealestateflutter/ui/settings/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';

class ReSingleContainer extends StatelessWidget {
  static const tag = 'ReSingleContainer';
  final String id;

  ReSingleContainer({
    @required @PathParam() this.id,
  });

  void _onReCardNavigate(BuildContext context, RealEstateListItem realEstate) {
    if (realEstate?.id != null) {
      ExtendedNavigator.of(context).push(
        Routes.reSingle(id: realEstate.id),
      );
    } else {
      log('Error, corrupted item, item.id == null', name: '$tag/_onReCardNavigate');
    }
  }

  void _onNavigateToDescription(BuildContext context, RealEstate realEstate) {
    ExtendedNavigator.of(context).push(
      Routes.reSingleDescription(id: id),
      arguments: DescriptionSingleScreenArguments(
        body: realEstate?.description,
        title: 'About this property',
        appBarTitle: '${realEstate?.type} ${realEstate?.dealType?.name} in ${realEstate?.shortAddress}',
      ),
    );
  }

  void _onNavigateToGallery(BuildContext context, RealEstate realEstate, int imageIndex) {
    ExtendedNavigator.of(context).push(
      Routes.reSingleGallery(id: id),
      arguments: GallerySingleScreenArguments(
        appBarTitle: '${realEstate?.type} ${realEstate?.dealType?.name} in ${realEstate?.shortAddress}',
        images: realEstate.images,
        startIndex: imageIndex,
      ),
    );
  }

  void _onShareAction(RealEstate realEstate) {
    Share.text(
      'Share Real Estate URL',
      'Check out this Real Estate from Allen Real Estates! \n\n${realEstate.url}',
      'text/plain',
    );
  }

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
          onNavigateToDescription: () => _onNavigateToDescription(context, model.mainState.data?.realEstate),
          onNavigateToGallery: (index) => _onNavigateToGallery(context, model.mainState.data?.realEstate, index),
          onReCardTap: (realEstate) => _onReCardNavigate(context, realEstate),
          onShareAction: () => _onShareAction(model.mainState.data?.realEstate),
          onRetry: () => model.getSingleData(id),
        );
      },
    );
  }
}
