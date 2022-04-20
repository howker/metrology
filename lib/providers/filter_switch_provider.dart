import 'package:flutter/cupertino.dart';

class FilterSwitchProvider extends ChangeNotifier {
  bool get onlyActualDataSwitcherState => _onlyActualDataSwitcherState;
  bool get onlyInvalidDataSwitcherState => _onlyInvalidDataSwitcherState;

  bool _onlyActualDataSwitcherState = false;
  bool _onlyInvalidDataSwitcherState = false;

  void setOnlyActualDataSwitcherState() {
    _onlyActualDataSwitcherState = !_onlyActualDataSwitcherState;
    notifyListeners();
  }

  void setOnlyInvalidDataSwitcherState(String finish) {
    _onlyInvalidDataSwitcherState = !_onlyInvalidDataSwitcherState;
    notifyListeners();
  }

  void clearAllSwitcherStates() {
    _onlyActualDataSwitcherState = false;
    _onlyInvalidDataSwitcherState = false;
    notifyListeners();
  }
}
