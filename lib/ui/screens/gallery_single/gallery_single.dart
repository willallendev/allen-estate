import 'package:allenrealestateflutter/ui/utils/app_bar_generators.dart';
import 'package:allenrealestateflutter/ui/widgets/custom_network_image/custom_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GallerySingleScreen extends StatefulWidget {
  final String appBarTitle;
  final List<String> images;
  final int startIndex;

  GallerySingleScreen({this.appBarTitle, this.images, this.startIndex});

  @override
  _GallerySingleScreenState createState() => _GallerySingleScreenState();
}

class _GallerySingleScreenState extends State<GallerySingleScreen> {
  final Color _startGradientColor = Color.fromRGBO(0, 121, 108, 1);
  final Color _endGradientColor = Color.fromRGBO(13, 54, 129, 1);
  final Color _fontColor = Colors.white.withOpacity(.8);
  PageController _pageController;
  int _currentPage;

  @override
  void initState() {
    int startIndex = 0;
    if (widget.startIndex != null && widget.startIndex <= widget.images.length) {
      startIndex = widget.startIndex;
    }
    _pageController = PageController(initialPage: startIndex);
    setState(() {
      _currentPage = startIndex + 1;
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final iconTheme = theme.iconTheme;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [_startGradientColor, _endGradientColor],
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          tileMode: TileMode.clamp,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: generateSimpleAppBar(
          titleSpacing: 0,
          iconTheme: iconTheme.copyWith(color: _fontColor),
          textStyle: textTheme.caption.copyWith(color: _fontColor),
          context: context,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: widget.appBarTitle,
        ),
        body: Stack(
          children: [
            Center(
              child: Container(
                height: 450,
                width: double.infinity,
                child: PageView(
                  onPageChanged: _onPageChanged,
                  controller: _pageController,
                  children:
                      widget.images.map((imageURL) => CustomNetworkImage(imageUrl: imageURL, fit: BoxFit.contain)).toList(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Colors.black.withOpacity(0.32),
                  ),
                  height: 24,
                  width: 42,
                  child: Center(
                    child: Text(
                      '$_currentPage / ${widget.images.length}',
                      textAlign: TextAlign.center,
                      style: textTheme.caption.copyWith(color: _fontColor),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
