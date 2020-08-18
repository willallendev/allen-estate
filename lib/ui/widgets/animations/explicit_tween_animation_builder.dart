import 'package:flutter/material.dart';

class ExplicitTweenAnimationBuilder extends StatefulWidget {
  final bool blinkAtStart;
  final Tween tween;
  final Duration duration;
  final Widget Function(BuildContext context, AnimationController controller, Animation animation) builder;
  final Widget Function(AnimationController) controllerBuilder;

  ExplicitTweenAnimationBuilder(
      {this.blinkAtStart = false,
      @required this.builder,
      this.controllerBuilder,
      @required this.tween,
      @required this.duration});

  @override
  _ExplicitTweenAnimationBuilderState createState() => _ExplicitTweenAnimationBuilderState();
}

class _ExplicitTweenAnimationBuilderState extends State<ExplicitTweenAnimationBuilder> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = widget.tween.animate(_controller);
    widget.controllerBuilder?.call(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.blinkAtStart) {
      _controller.forward().then((value) => _controller.reverse());
    }
    return widget.builder(context, _controller, _animation);
  }
}
