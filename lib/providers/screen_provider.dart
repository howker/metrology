import 'package:flutter/material.dart';

class ScreenProvider extends ChangeNotifier {
  int get currentScreenIndex => _currentScreenIndex;
  int _currentScreenIndex = 0;

  void setCurrentScreenIndex(int index) {
    _currentScreenIndex = index;
    notifyListeners();
  }
}
