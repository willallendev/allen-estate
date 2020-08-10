import 'package:allenrealestateflutter/core/ioc/locator.dart';
import 'package:allenrealestateflutter/core/view_models/base_view_model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseContainer<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;

  BaseContainer({@required this.builder, this.onModelReady})
      : assert(builder != null, '[BaseContainer] - Error, builder Function must be provided');

  @override
  State createState() {
    return _BaseContainerState<T>();
  }
}

class _BaseContainerState<T extends BaseViewModel> extends State<BaseContainer<T>> {
  T viewModel = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(viewModel);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => viewModel,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
