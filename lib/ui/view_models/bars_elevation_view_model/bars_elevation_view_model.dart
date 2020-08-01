import 'package:flutter/material.dart';

class BarsElevationViewModel extends ChangeNotifier {
  ScrollController _scrollController;
  final double _minOffset = 10.0;
  bool _isAtTop = true;
  bool _isAtBottom = false;
  double _outOfRangeElevation;
  double _topAppBarElevation = 0;
  double _bottomAppBarElevation = 5;

  double get topAppBarElevation => _topAppBarElevation;
  double get bottomAppBarElevation => _bottomAppBarElevation;

  ScrollController get scrollController => _scrollController;

  BarsElevationViewModel({double elevation = 5}) {
    this._outOfRangeElevation = elevation ?? 5;
    this._scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _scrollListener() {
    if (_scrollController.offset <= _scrollController.position.minScrollExtent && !_scrollController.position.outOfRange) {
      //call notifyListeners only when values are about to change
      if (!_isAtTop) {
        //reach the top
        _isAtTop = true;
        _topAppBarElevation = 0;
        notifyListeners();
      }
    } else {
      //call notifyListeners only when values are about to change
      if (_scrollController.offset > _minOffset && _isAtTop) {
        //not the top
        _isAtTop = false;
        _topAppBarElevation = _outOfRangeElevation;
        notifyListeners();
      }
    }

    if (_scrollController.offset >= _scrollController.position.maxScrollExtent && !_scrollController.position.outOfRange) {
      //call notifyListeners only when values are about to change
      if (!_isAtBottom) {
        //reach the top
        _isAtBottom = true;
        _bottomAppBarElevation = 0;
        notifyListeners();
      }
    } else {
      //call notifyListeners only when values are about to change
      if (_scrollController.offset > _minOffset && _isAtBottom) {
        //not the top
        _isAtBottom = false;
        _bottomAppBarElevation = _outOfRangeElevation;
        notifyListeners();
      }
    }
  }
}
