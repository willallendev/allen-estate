import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final TextStyle textStyle;
  final BoxFit fit;

  CustomNetworkImage({@required this.imageUrl, this.textStyle, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return CachedNetworkImage(
      fit: fit,
      errorWidget: (context, url, error) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FaIcon(FontAwesomeIcons.solidDizzy, color: textStyle?.color ?? textTheme.bodyText1.color),
            Container(height: 16),
            Text('Could not load image', style: textStyle ?? textTheme.caption.copyWith(color: textTheme.bodyText1.color)),
          ],
        ),
      ),
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor),
        ),
      ),
      imageUrl: imageUrl,
    );
  }
}
