import 'package:flutter/cupertino.dart';

class FilterSwitchProvider extends ChangeNotifier {
  bool get onlyActualDataSwitcherState => _onlyActualDataSwitcherState;
  bool get onlyInvalidDataSwitcherState => _onlyInvalidDataSwitcherState;

  bool _onlyActualDataSwitcherState = false;
  bool _onlyInvalidDataSwitcherState = false;

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

  void clearAllSwitcherStates() {
    _onlyActualDataSwitcherState = false;
    _onlyInvalidDataSwitcherState = false;
    notifyListeners();
  }
}
