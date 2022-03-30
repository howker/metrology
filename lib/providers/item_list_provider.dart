import 'package:flutter/material.dart';
import 'package:infopoverka/domain/items_repository.dart';
import 'package:infopoverka/models/item.dart';

class ItemListProvider extends ChangeNotifier {
  final ItemsRepository _itemsRepo = ItemsRepository();

  String search = '';
  bool loadingState = false;

  List<Items>? get items => _items;
  List<Items>? _items;

  Future<void> loadItemsList(String userSearch) async {
    search = userSearch;
    loadingState = true;
    _items = await getItemsList(userSearch) as List<Items>;
    loadingState = false;

    notifyListeners();
  }

  void clearItemsList() {
    loadingState = false;
    _items?.clear();
    notifyListeners();
  }

  Future getItemsList(String userSearch) async =>
      _itemsRepo.getItems(search: search);
}
