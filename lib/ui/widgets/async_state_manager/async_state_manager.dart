import 'package:allenrealestateflutter/core/data_models/async_state.dart';
import 'package:allenrealestateflutter/ui/widgets/custom_raised_button/custom_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AsyncStateManager extends StatelessWidget {
  final AsyncState state;
  final Widget Function(BuildContext context) builder;
  final void Function() onRetry;
  final Widget error;
  final Widget notFound;
  final Widget noResults;
  final Widget loading;

  AsyncStateManager({this.state, @required this.builder, this.error, this.loading, this.onRetry, this.notFound, this.noResults})
      : assert(builder != null, 'child param must be provided');

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case AsyncState.initial:
        return loading ?? _buildLoadingContent(context);
      case AsyncState.loading:
        return loading ?? _buildLoadingContent(context);
      case AsyncState.error:
        return error ?? _buildErrorContent(context: context, showButton: true);
      case AsyncState.notFound:
        return error ?? _buildErrorContent(context: context, text: '404, seems like you are lost');
      case AsyncState.notResults:
        return error ?? _buildErrorContent(context: context, text: 'Sorry, no results where found');
      case AsyncState.done:
        return builder(context);
      default:
        return builder(context);
    }
  }

  Widget _buildLoadingContent(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Theme(
        data: Theme.of(context),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor),
        ),
      ),
    );
  }

  Widget _buildErrorContent(
      {BuildContext context, String text = 'Sorry Something went wrong...', bool showButton = false, Widget icon}) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final _icon = icon ?? FaIcon(FontAwesomeIcons.solidDizzy, color: textTheme.bodyText1.color, size: 24);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _icon,
        Container(height: 8),
        Text(
          text,
          style: textTheme.bodyText1,
          softWrap: true,
        ),
        Container(height: 32),
        if (showButton && onRetry != null)
          CustomRaisedButton(
            child: Text('Retry'),
            onPressed: onRetry,
          ),
      ],
    );
  }
}
