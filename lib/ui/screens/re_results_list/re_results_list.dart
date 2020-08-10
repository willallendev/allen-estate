import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/ui/utils/app_bar_generators.dart';
import 'package:allenrealestateflutter/ui/view_models/bars_elevation_view_model/bars_elevation_view_model.dart';
import 'package:allenrealestateflutter/ui/widgets/lists/re_list/re_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReResultsListScreen extends StatelessWidget {
  static const tag = 'ReResultsListScreen';
  final void Function(RealEstateListItem) onReTap;
  final void Function() onSearch;
  final void Function() onFilter;
  final void Function() onEndReached;
  final bool noMore;
  final List<RealEstateListItem> reList;
  final String title;

  ReResultsListScreen({this.onReTap, this.onSearch, this.onFilter, this.onEndReached, this.noMore, this.reList, this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListenableProvider(
      create: (_) => BarsElevationViewModel(),
      builder: (context, _) => Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: generateResultsSearchAppBar(
          context: context,
          title: title,
          elevation: context.watch<BarsElevationViewModel>().topAppBarElevation,
          onFilter: onFilter,
          onSearch: onSearch,
        ),
        body: ReList(
          controller: context.watch<BarsElevationViewModel>().scrollController,
          realEstateList: reList,
          onTap: onReTap,
          onEndReached: onEndReached,
          noMore: noMore,
        ),
      ),
    );
  }
}
