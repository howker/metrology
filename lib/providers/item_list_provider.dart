import 'package:flutter/material.dart';
import 'package:infopoverka/data/items_repository.dart';
import 'package:infopoverka/models/item.dart';
import 'package:infopoverka/utils/valid_data_check.dart';

class ItemListProvider extends ChangeNotifier {
  final ItemsRepository itemsRepo;
  final List<Items> _items = [];
  Item item = Item(result: Result(count: 0, start: 0, rows: 0, items: []));
  String startYear = '';
  String finishYear = '';
  int startRecord = 0;

  String get currentSearchingYear => _currentSearchingYear;
  List<Items> get items => _items;
  bool get loadingState => _loadingState;
  String get search => _search;
  List<Items> get filteredList => _filteredList;
  Items get itemByVriId => _itemByVriId;

  List<Items> _filteredList = [];
  String _search = '';
  String _currentSearchingYear = '';
  bool _loadingState = false;
  int _year = 2018;
  Items _itemByVriId = Items(
    vriId: '',
    orgTitle: '',
    mitNumber: '',
    mitTitle: '',
    mitNotation: '',
    miModification: '',
    miNumber: '',
    verificationDate: '',
    validDate: '',
    resultDocnum: '',
    applicability: false,
  );

  ItemListProvider({required this.itemsRepo});

  void setFilteredList({
    required bool onlyActualData,
    required bool onlyInvalidData,
    required String mitTitleFilter,
    required String mitNotation,
    required String orgTitle,
  }) {
    _filteredList = items;
    if (onlyActualData) {
      _filteredList = _filteredList
          .where(
            (element) => ValidDataCheck.validStatus(element.validDate ?? ''),
          )
          .toList();
    }
    if (onlyInvalidData) {
      _filteredList = _filteredList
          .where((element) => !ValidDataCheck.validStatus(
                element.validDate ?? '',
              ))
          .toList();
    }
    if (mitTitleFilter != '') {
      _filteredList = _filteredList
          .where(
            (element) => element.mitTitle == mitTitleFilter,
          )
          .toList();
    }
    if (mitNotation != '') {
      _filteredList = _filteredList
          .where(
            (element) => element.mitNotation == mitNotation,
          )
          .toList();
    }
    if (orgTitle != '') {
      _filteredList = _filteredList
          .where(
            (element) => element.orgTitle == orgTitle,
          )
          .toList();
    }
    if (!onlyActualData &&
        !onlyInvalidData &&
        mitTitleFilter == '' &&
        mitNotation == '' &&
        orgTitle == '') {
      _filteredList = items;
    }

    notifyListeners();
  }

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

      // TODO(me): add user settings fo enable/disable accurate search,
      // final accurateList =
      //     _items.where((element) => element.miNumber == search).toList();

      // _items = accurateList;

      //  setFilteredList(onlyActualData: false, onlyInvalidData: false);

      _loadingState = false;

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
    _filteredList = items;
    notifyListeners();
  }

  Future getItem(String userSearch, String year) async =>
      itemsRepo.getItem(search: search, year: year, startRecord: startRecord);

  Future<void> loadItemsByVriId({
    required String vriId,
  }) async {
    _loadingState = true;
    _itemByVriId = await getItemByVriId(vriId) as Items;
    _loadingState = false;

    notifyListeners();
  }

  Future<Items?> getItemByVriId(String vriId) async =>
      itemsRepo.getItemByVriId(vriId: vriId);
}
