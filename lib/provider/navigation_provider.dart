import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BottomNavigationProvider extends ChangeNotifier {


  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  double _indicatorPosition  = 0;
  double get indicatorPosition => _indicatorPosition;


  void changeScreen() {
    _currentIndex = (_currentIndex + 1) % 4;
    notifyListeners();
  }


  void setIndex(int index,context) {
    if (_currentIndex != index) {
      _currentIndex = index;
      _indicatorPosition = MediaQuery.of(context).size.width / 4 * _currentIndex;
      notifyListeners();
    }
  }


}