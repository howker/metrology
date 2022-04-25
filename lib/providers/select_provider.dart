import 'package:flutter/material.dart';
import 'package:infopoverka/models/item.dart';

class SelectProvider extends ChangeNotifier {
  final List<Items> _selectedList = [];
  bool get selectPressedState => _selectPressedState;
  bool _selectPressedState = false;

  void setSelectPressedState() {
    _selectPressedState = !_selectPressedState;
    notifyListeners();
  }

  void addItemToSelectedList({required Items item}) {
    _selectedList.add(item);
    notifyListeners();
  }
}
