import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionPreview extends StatelessWidget {
  final String text;
  final double height;
  final TextStyle style;
  final void Function() onTap;

  DescriptionPreview({@required this.text, this.height = 96, this.style, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: 0.8,
        child: Container(
          constraints: BoxConstraints.loose(Size(double.infinity, height)),
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              Text(
                text,
                style: style ?? textTheme.bodyText1,
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [theme.backgroundColor.withOpacity(.75), theme.backgroundColor.withOpacity(.4)],
                      end: Alignment.topCenter,
                      begin: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
