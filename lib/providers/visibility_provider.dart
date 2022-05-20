import 'package:flutter/material.dart';

class VisibilityProvider extends ChangeNotifier {
  bool get mitTitleFormFieldvisibility => _mitTitleFormFieldVisibility;
  bool get mitNotationFormFieldVisibility => _mitNotationFormFieldVisibility;
  bool get orgTitleFormFieldVisibility => _orgTitleFormFieldVisibility;

  bool _mitTitleFormFieldVisibility = true;
  bool _mitNotationFormFieldVisibility = true;
  bool _orgTitleFormFieldVisibility = true;

  void mitTitleFormSetActive() {
    _mitNotationFormFieldVisibility = false;
    _orgTitleFormFieldVisibility = false;
    _mitTitleFormFieldVisibility = true;

    notifyListeners();
  }

  void mitOrgTitleFormSetActive() {
    _mitNotationFormFieldVisibility = false;
    _orgTitleFormFieldVisibility = true;
    _mitTitleFormFieldVisibility = false;

    notifyListeners();
  }

  void mitNotationFormSetActive() {
    _mitNotationFormFieldVisibility = true;
    _orgTitleFormFieldVisibility = false;
    _mitTitleFormFieldVisibility = false;

    notifyListeners();
  }
}
