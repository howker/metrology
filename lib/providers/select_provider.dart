import 'package:flutter/material.dart';
import 'package:infopoverka/models/item.dart';

class SelectProvider extends ChangeNotifier {
  final Set<Items> _selectedList = {};
  Set<Items> get selectedList => _selectedList;
  bool get selectAllState => _selectAllState;

  bool _selectAllState = false;

  bool isSelected(Items item) {
    return item.isSelected;
  }

  void toggleItemSelected(Items item) {
    item.isSelected = !item.isSelected;
    notifyListeners();
  }

  void addItemToSelectedList({required Items item}) {
    _selectedList.add(item);
    notifyListeners();
  }

  void addAllItemsToSelectedList({required List<Items> itemsList}) {
    if (!_selectAllState) {
      for (final item in itemsList) {
        if (!item.isSelected) {
          _selectedList.add(item);
          toggleItemSelected(item);
        }
      }
    } else {
      for (final item in _selectedList) {
        toggleItemSelected(item);
      }
      _selectedList.clear();
    }

    _selectAllState = !_selectAllState;
    notifyListeners();
  }

  void removeItemFromSelectedList({required Items item}) {
    _selectedList.remove(item);
    notifyListeners();
  }

  void clearSelectedList() {
    _selectedList.clear();
    notifyListeners();
  }

  void addToFavorites({required List<Items> itemsList}) {
    /*  прочитать список из хранилища 
   проверить есть ли в списке
   добавить в список
   сохранить список в хранилище   
   */
  }
}
