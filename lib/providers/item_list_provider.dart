import 'package:flutter/material.dart';
import 'package:infopoverka/domain/items_repository.dart';
import 'package:infopoverka/models/item.dart';

class ItemListProvider extends ChangeNotifier {
  final ItemsRepository _itemsRepo = ItemsRepository();

  String startYear = '';
  String finishYear = '';

  String get currentSearchingYear => _currentSearchingYear;
  List<Items> get items => _items;
  bool get loadingState => _loadingState;
  String get search => _search;

  String _search = '';
  String _currentSearchingYear = '';
  List<Items> _items = [];
  bool _loadingState = false;
  int _year = 2018;

  Future<void> loadItemsList({
    required String userSearch,
    required String startYear,
    required String finishYear,
  }) async {
    final intFinishYear = int.parse(finishYear);

    for (_year = int.parse(startYear); _year <= intFinishYear;) {
      _loadingState = true;
      _currentSearchingYear = _year.toString();
      _items = await getItemsList(userSearch, _year.toString()) as List<Items>;
      _loadingState = false;

      //TODO(howker): добавить продолжение цикла если найден например в 2020 году номер 40791720 (искал меркурий а нашёл Бетар)
      //то, нужно искать дальше до конца диапазона и в 2021 и в 2022 году и строить список всех найденных,
      //затем фильтровать по типу прибора

      if (_items.isEmpty) {
        if (startYear != finishYear) {
          _year++;
        } else {
          break;
        }
      } else {
        break;
      }
      notifyListeners();
    }

    notifyListeners();
  }

  void setSearchRequest(String searchRequest) {
    _search = searchRequest;
    notifyListeners();
  }

  void clearItemsList() {
    _loadingState = false;
    _items.clear();
    notifyListeners();
  }

  Future getItemsList(String userSearch, String year) async =>
      _itemsRepo.getItems(search: search, year: year);
}
