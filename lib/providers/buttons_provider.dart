import 'dart:async';

import 'package:flutter/material.dart';

class ButtonsProvider extends ChangeNotifier {
  bool get isButtonActive => _isButtonActive;

  bool _isButtonActive = false;

  void buttonClicked() {
    _isButtonActive = true;
    notifyListeners();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        _isButtonActive = false;
        notifyListeners();
      },
    );
  }
}
