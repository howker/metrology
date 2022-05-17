import 'dart:async';

import 'package:flutter/material.dart';

class ButtonsProvider extends ChangeNotifier {
  bool get isSearchButtonActive => _isSearchButtonActive;
  bool get isQrButtonActive => _isQrButtonActive;

  bool _isSearchButtonActive = false;
  bool _isQrButtonActive = false;

  void searchButtonClicked() {
    _isSearchButtonActive = true;
    notifyListeners();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        _isSearchButtonActive = false;
        notifyListeners();
      },
    );
  }

  void qrButtonClicked() {
    _isQrButtonActive = true;
    notifyListeners();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        _isQrButtonActive = false;
        notifyListeners();
      },
    );
  }
}
