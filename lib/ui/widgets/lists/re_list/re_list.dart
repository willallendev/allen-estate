import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/ui/widgets/re_list_tile/re_list_tile.dart';
import 'package:flutter/material.dart';

class ReList extends StatefulWidget {
  final List<RealEstateListItem> realEstateList;
  final void Function(RealEstateListItem realEstate) onTap;
  final ScrollController controller;
  final double verticalPadding;
  final bool noMore;
  final void Function() onEndReached;
  // List of index that have already called onEndReached

  ReList({this.realEstateList, this.onTap, this.verticalPadding = 8, this.noMore = false, this.onEndReached, this.controller})
      : assert(realEstateList != null),
        assert(noMore != null),
        assert(verticalPadding != null),
        assert(verticalPadding.isFinite),
        assert(!verticalPadding.isNegative),
        assert(!verticalPadding.isNaN);

  @override
  _ReListState createState() => _ReListState();
}

class _ReListState extends State<ReList> {
  final List<int> _bannedCallers = [];

  Widget _tileBuilder(BuildContext context, int index) {
    final theme = Theme.of(context);
    final progressIndicatorHeight = 16.0;

    if (!widget.noMore && index == widget.realEstateList.length - 3 && !_bannedCallers.contains(index)) {
      _bannedCallers.add(index);
      widget.onEndReached?.call();
    }

    if (index >= widget.realEstateList.length) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: SizedBox(
            height: progressIndicatorHeight,
            width: progressIndicatorHeight,
            child: CircularProgressIndicator(
              strokeWidth: 1.8,
              valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor),
            ),
          ),
        ),
      );
    }

    Widget tileWidget = ReListTile(realEstate: widget.realEstateList[index], onTap: widget.onTap);
    if (widget.realEstateList[index] == widget.realEstateList.first) {
      return Padding(
        padding: EdgeInsets.only(top: widget.verticalPadding),
        child: tileWidget,
      );
    } else if (widget.realEstateList[index] == widget.realEstateList.last) {
      return Padding(
        padding: EdgeInsets.only(bottom: widget.verticalPadding),
        child: tileWidget,
      );
    }

    return tileWidget;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Theme(
      data: theme.copyWith(accentColor: theme.backgroundColor),
      child: ListView.builder(
        controller: widget.controller,
        itemBuilder: _tileBuilder,
        itemCount: widget.noMore ? widget.realEstateList.length : widget.realEstateList.length + 1,
      ),
    );
  }
}
