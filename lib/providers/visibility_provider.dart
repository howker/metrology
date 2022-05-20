import 'package:flutter/material.dart';

class VisibilityProvider extends ChangeNotifier {
  bool get mitTitleFormFieldvisibility => _mitTitleFormFieldVisibility;
  bool get mitNotationFormFieldVisibility => _mitNotationFormFieldVisibility;
  bool get orgTitleFormFieldVisibility => _orgTitleFormFieldVisibility;
  bool get showFilterAppBar => _showFilterAppBar;

  bool _mitTitleFormFieldVisibility = true;
  bool _mitNotationFormFieldVisibility = true;
  bool _orgTitleFormFieldVisibility = true;
  bool _showFilterAppBar = true;

  void mitTitleFormSetActive() {
    _mitNotationFormFieldVisibility = false;
    _orgTitleFormFieldVisibility = false;
    _mitTitleFormFieldVisibility = true;
    _showFilterAppBar = false;

    notifyListeners();
  }

  void mitOrgTitleFormSetActive() {
    _mitNotationFormFieldVisibility = false;
    _orgTitleFormFieldVisibility = true;
    _mitTitleFormFieldVisibility = false;
    _showFilterAppBar = false;

    notifyListeners();
  }

  void mitNotationFormSetActive() {
    _mitNotationFormFieldVisibility = true;
    _orgTitleFormFieldVisibility = false;
    _mitTitleFormFieldVisibility = false;
    _showFilterAppBar = false;

    notifyListeners();
  }

  void allFormsSetActive() {
    _mitNotationFormFieldVisibility = true;
    _orgTitleFormFieldVisibility = true;
    _mitTitleFormFieldVisibility = true;
    _showFilterAppBar = true;

    notifyListeners();
  }
}
