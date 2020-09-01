import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomRaisedButton extends StatelessWidget {
  static final VisualDensity visualDensity = VisualDensity();
  final BoxConstraints effectiveConstraints =
      visualDensity.effectiveConstraints(const BoxConstraints(minWidth: 88.0, minHeight: 36.0));
  static final Offset densityAdjustment = visualDensity.baseSizeAdjustment;
  final EdgeInsetsGeometry padding = EdgeInsets.only(
    left: densityAdjustment.dx,
    top: densityAdjustment.dy,
    right: densityAdjustment.dx,
    bottom: densityAdjustment.dy,
  ).clamp(EdgeInsets.zero, EdgeInsetsGeometry.infinity);
  final Color _startGradientColor = Color.fromRGBO(0, 121, 108, 1);
  final Color _endGradientColor = Color.fromRGBO(13, 54, 129, 1);

  final VoidCallback onPressed;
  final Widget child;

  CustomRaisedButton({
    this.onPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _baseTextTheme = theme.textTheme;
    final _textTheme = _baseTextTheme.copyWith(
      headline1: _baseTextTheme.headline1.copyWith(color: Colors.white),
      headline2: _baseTextTheme.headline2.copyWith(color: Colors.white),
      headline3: _baseTextTheme.headline3.copyWith(color: Colors.white),
      headline4: _baseTextTheme.headline4.copyWith(color: Colors.white),
      headline5: _baseTextTheme.headline5.copyWith(color: Colors.white),
      headline6: _baseTextTheme.headline6.copyWith(color: Colors.white),
      subtitle1: _baseTextTheme.subtitle1.copyWith(color: Colors.white),
      subtitle2: _baseTextTheme.subtitle2.copyWith(color: Colors.white),
      bodyText1: _baseTextTheme.bodyText1.copyWith(color: Colors.white),
      bodyText2: _baseTextTheme.bodyText2.copyWith(color: Colors.white),
      caption: _baseTextTheme.caption.copyWith(color: Colors.white),
      overline: _baseTextTheme.overline.copyWith(color: Colors.white),
      button: _baseTextTheme.button.copyWith(color: Colors.white),
    );

    return ConstrainedBox(
      constraints: effectiveConstraints,
      child: Theme(
        data: theme.copyWith(textTheme: _textTheme),
        isMaterialAppTheme: true,
        child: Material(
          type: MaterialType.button,
          clipBehavior: Clip.antiAlias,
          elevation: 6,
          color: Colors.white,
          shadowColor: Colors.teal,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [_startGradientColor, _endGradientColor],
                begin: Alignment(0, 0),
                end: Alignment(0.6, 1),
                tileMode: TileMode.clamp,
              ),
            ),
            child: InkWell(
              onTap: onPressed,
              child: Container(
                padding: padding,
                constraints: BoxConstraints(minWidth: 96, maxWidth: double.infinity),
                child: Center(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
