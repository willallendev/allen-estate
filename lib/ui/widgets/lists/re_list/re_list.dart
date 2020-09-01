import 'package:allenrealestateflutter/core/data_models/real_estate.dart';
import 'package:allenrealestateflutter/ui/widgets/custom_raised_button/custom_raised_button.dart';
import 'package:allenrealestateflutter/ui/widgets/re_list_tile/re_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReList extends StatefulWidget {
  final List<RealEstateListItem> realEstateList;
  final void Function(RealEstateListItem realEstate) onTap;
  final ScrollController controller;
  final double verticalPadding;
  final bool noMore;
  final bool error;
  final void Function() onRetry;
  final void Function() onEndReached;

  // List of index that have already called onEndReached

  ReList(
      {this.realEstateList,
      this.onTap,
      this.verticalPadding = 8,
      this.noMore = false,
      this.onEndReached,
      this.controller,
      this.error = false,
      this.onRetry})
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
    final textTheme = theme.textTheme;
    final progressIndicatorHeight = 16.0;

    if (!widget.noMore && index == widget.realEstateList.length - 3 && !_bannedCallers.contains(index)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _bannedCallers.add(index);
        widget.onEndReached?.call();
      });
    }

    if (index >= widget.realEstateList.length) {
      if (widget.error ?? false) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FaIcon(
                FontAwesomeIcons.solidFlushed,
                color: theme.primaryColor,
                size: 24,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Something went wrong, make sure you have internet connection',
                    style: textTheme.overline.copyWith(color: theme.primaryColor),
                  ),
                ),
              ),
              CustomRaisedButton(
                child: Text('Retry'),
                onPressed: widget.onRetry,
              ),
            ],
          ),
        );
      }
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 32, top: 8),
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
