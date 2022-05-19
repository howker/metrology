import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;

  bool get getIsDark {
    isDark = Hive.box<bool>('darkModeBox')
        .get('darkModeBox', defaultValue: false) as bool;

    return isDark;
  }

  void changeTheme() {
    isDark = !isDark;
    Hive.box<bool>('darkModeBox').put('darkModeBox', isDark);

    notifyListeners();
  }
}
