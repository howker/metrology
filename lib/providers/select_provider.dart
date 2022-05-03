import 'package:flutter/material.dart';
import 'package:infopoverka/models/item.dart';

class SelectProvider extends ChangeNotifier {
  final List<Items> _selectedList = [];
  List<Items> get selectedList => _selectedList;
  bool get selectAllState => _selectAllState;
  bool _selectAllState = false;

  void setSelectAllState() {
    _selectAllState = !_selectAllState;
    notifyListeners();
  }

  void addItemToSelectedList({required Items item}) {
    _selectedList.add(item);
    notifyListeners();
  }

  void addAllItemsToSelectedList({required List<Items> items}) {
    _selectedList.addAll(items);
    notifyListeners();
  }

  void removeItemFromSelectedList({required Items item}) {
    _selectedList.remove(item);
    notifyListeners();
  }

  void clearSelectedList() {
    _selectedList.clear();
    //_selectPressedState = false;
    notifyListeners();
  }
}
