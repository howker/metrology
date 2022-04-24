import 'package:flutter/cupertino.dart';

class FilterProvider extends ChangeNotifier {
  bool get onlyActualDataSwitcherState => _onlyActualDataSwitcherState;
  bool get onlyInvalidDataSwitcherState => _onlyInvalidDataSwitcherState;
  String get mitTitleFormFieldText => _mitTitleFormFieldText;
  String get mitNotationFieldText => _mitNotationFieldText;

  bool _onlyActualDataSwitcherState = false;
  bool _onlyInvalidDataSwitcherState = false;
  String _mitTitleFormFieldText = '';
  String _mitNotationFieldText = '';

  void setOnlyActualDataSwitcherState() {
    _onlyActualDataSwitcherState = !_onlyActualDataSwitcherState;
    _onlyInvalidDataSwitcherState = false;
    notifyListeners();
  }

  void setOnlyInvalidDataSwitcherState() {
    _onlyInvalidDataSwitcherState = !_onlyInvalidDataSwitcherState;
    _onlyActualDataSwitcherState = false;
    notifyListeners();
  }

  void setMitTitleFormFieldText(String text) {
    _mitTitleFormFieldText = text;
    notifyListeners();
  }

  void setMitNotationFieldText(String text) {
    _mitNotationFieldText = text;
    notifyListeners();
  }

  void clearAllSwitcherAndFieldsStates() {
    _onlyActualDataSwitcherState = false;
    _onlyInvalidDataSwitcherState = false;
    _mitTitleFormFieldText = '';
    notifyListeners();
  }
}
