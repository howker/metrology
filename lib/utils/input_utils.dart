import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputUtils {
  static void hideKeyboard() {
    SystemChannels.textInput.invokeMethod<String>('TextInput.hide');
  }

  static void unFocus() {
    if (WidgetsBinding.instance != null) {
      WidgetsBinding.instance!.focusManager.primaryFocus?.unfocus();
    }
  }
}
