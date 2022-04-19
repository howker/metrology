import 'package:flutter/material.dart';
import 'package:infopoverka/data/items_repository.dart';
import 'package:infopoverka/models/item.dart';

class ItemListProvider extends ChangeNotifier {
  final ItemsRepository itemsRepo;

  final List<Items> _items = [];
  String startYear = '';
  String finishYear = '';
  int startRecord = 0;

  Item item = Item(result: Result(count: 0, start: 0, rows: 0, items: []));

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
    required int startRecord,
  }) async {
    final intFinishYear = int.parse(finishYear);

    for (_year = int.parse(startYear); _year <= intFinishYear; _year++) {
      _loadingState = true;
      _currentSearchingYear = _year.toString();

      item = await getItem(userSearch, _year.toString()) as Item;

      _items.addAll(item.result.items);

      _loadingState = false;

      notifyListeners();
    }

    notifyListeners();
  }

  // if (response.statusCode! >= 200 && response.statusCode! < 300) {
  //   final item = Item.fromJson(
  //     json.decode(response.toString()) as Map<String, dynamic>,
  //   );

  //   final itemsList = item.result.items;

  //   final accurateList =
  //       itemsList.where((element) => element.miNumber == search).toList();

  //   return accurateList;
  // } else {
  //   throw Exception('HTTP request error: ${response.statusCode}');
  // }

  void setSearchRequest(String searchRequest) {
    _search = searchRequest;
    notifyListeners();
  }

  void clearItemsList() {
    _loadingState = false;
    _items.clear();
    notifyListeners();
  }

  Future getItem(String userSearch, String year) async =>
      itemsRepo.getItem(search: search, year: year, startRecord: startRecord);
}
