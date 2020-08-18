import 'package:allenrealestateflutter/ui/widgets/custom_network_image/custom_network_image.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> images;
  final void Function(int) onTap;

  ImageCarousel({@required this.images, this.onTap}) : assert(images != null, '[ImageCarousel] - images cannot be null');

  @override
  State createState() {
    return _ImageCarouselState();
  }
}

class _ImageCarouselState extends State<ImageCarousel> {
  int currentPage;
  PageController pageController;

  void onPageChanged(int page) {
    setState(() {
      currentPage = page + 1;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    setState(() {
      currentPage = 1;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Container(
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            buildPageView(),
            buildPageEnumerator(context),
          ],
        ),
      ),
    );
  }

  PageView buildPageView() {
    return PageView(
      onPageChanged: onPageChanged,
      controller: pageController,
      children: widget.images
          .asMap()
          .entries
          .map(
            (entry) => GestureDetector(
              onTap: () => widget.onTap?.call(entry.key),
              child: CustomNetworkImage(imageUrl: entry.value),
            ),
          )
          .toList(),
    );
  }

  Container buildPageEnumerator(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    Widget content = Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.32),
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      height: 24,
      width: 42,
      child: Center(
        child: Text(
          '$currentPage / ${widget.images.length}',
          style: textTheme.caption.copyWith(color: Colors.white.withOpacity(.6)),
        ),
      ),
    );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      alignment: Alignment.bottomLeft,
      child: content,
    );
  }
}
