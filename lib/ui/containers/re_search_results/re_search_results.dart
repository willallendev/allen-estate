import 'dart:developer';

import 'package:allenrealestateflutter/core/data_models/pagination_data.dart';
import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/core/view_models/re_search_results/re_search_results.dart';
import 'package:allenrealestateflutter/ui/containers/base_container/base_container.dart';
import 'package:allenrealestateflutter/ui/screens/re_results_list/re_results_list.dart';
import 'package:allenrealestateflutter/ui/settings/router/router.gr.dart';
import 'package:allenrealestateflutter/ui/utils/re_search_delegate.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';

class ReSearchResultsContainer extends StatelessWidget {
  static const tag = 'ReSearchResultsContainer';
  final String query;

  ReSearchResultsContainer({
    @required @QueryParam() this.query,
  });

  void _onSearch(BuildContext context) async {
    String query = await showSearch<String>(context: context, delegate: ReSearchDelegate());
    if (query != null) {
      ExtendedNavigator.of(context).push(
        Routes.reSearchResults,
        queryParams: {'query': query},
      );
    }
  }

  void _onReNavigate(BuildContext context, RealEstateListItem realEstate) {
    if (realEstate?.id != null) {
      ExtendedNavigator.of(context).push(
        Routes.reSingle(id: realEstate.id),
      );
    } else {
      log('Error, corrupted item, item.id == null', name: '$tag/_onReCardNavigate');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseContainer<ReSearchResultsViewModel>(
      onModelReady: (ReSearchResultsViewModel model) {
        model.query = query;
        model.init();
      },
      builder: (BuildContext context, ReSearchResultsViewModel model, Widget child) {
        PaginationData pagination = model.mainState.pagination;
        return ReResultsListScreen(
          title: query?.trim(),
          onSearch: () => _onSearch(context),
          noMore: pagination.currentPage == pagination.lastPage,
          reList: model.mainState.data,
          onFilter: () => log('onFilter', name: tag),
          onEndReached: () => model.init(),
          onReTap: (realEstate) => _onReNavigate(context, realEstate),
          state: model.mainState.state,
          onRetry: model.init,
        );
      },
    );
  }
}
