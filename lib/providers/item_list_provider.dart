import 'package:flutter/material.dart';
import 'package:infopoverka/domain/items_repository.dart';
import 'package:infopoverka/models/item.dart';

class ItemListProvider extends ChangeNotifier {
  late final ItemsRepository _itemsRepo;
  List<Items>? get items => _items;
  List<Items>? _items;

  Future<void> loadItemsList() async {
    _items = await getItemsList() as List<Items>;

    notifyListeners();
  }

  Future getItemsList() async => _itemsRepo.getItems(search: '', year: '');
}
