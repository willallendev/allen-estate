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
          height: height,
          child: Text(
            text,
            style: style ?? textTheme.bodyText1,
            softWrap: true,
            overflow: TextOverflow.fade,
          ),
        ),
      ),
    );
  }
}
