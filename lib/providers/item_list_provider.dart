import 'package:flutter/material.dart';
import 'package:infopoverka/data/items_repository.dart';
import 'package:infopoverka/models/item.dart';

class ItemListProvider extends ChangeNotifier {
  final ItemsRepository itemsRepo;

  final List<Items> _items = [];
  String startYear = '';
  String finishYear = '';

  String get currentSearchingYear => _currentSearchingYear;
  List<Items> get items => _items;
  bool get loadingState => _loadingState;
  String get search => _search;

  String _search = '';
  String _currentSearchingYear = '';

  bool _loadingState = false;
  int _year = 2018;

  ItemListProvider({required this.itemsRepo});

  Future<void> loadItemsList({
    required String userSearch,
    required String startYear,
    required String finishYear,
  }) async {
    final intFinishYear = int.parse(finishYear);

    for (_year = int.parse(startYear); _year <= intFinishYear; _year++) {
      _loadingState = true;
      _currentSearchingYear = _year.toString();

      _items.addAll(
        await getItemsList(userSearch, _year.toString()) as List<Items>,
      );

      _loadingState = false;

      //TODO  для примера если искать с 2015 по 2017  номер 21247002  = будет 2 одинаковых номера но приборы разные
      // в результате список - нужно реализовать сортировку по разным полям

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
      itemsRepo.getItems(search: search, year: year);
}
