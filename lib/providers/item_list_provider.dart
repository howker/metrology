import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:infopoverka/data/favorites_repository.dart';
import 'package:infopoverka/data/items_repository.dart';
import 'package:infopoverka/models/item.dart';
import 'package:infopoverka/utils/valid_data_check.dart';

class ItemListProvider extends ChangeNotifier {
  final ItemsRepository itemsRepo;
  final FavoritesRepository favoritesRepo;
  final Set<Items> _items = {};
  final Set<Items> _accurateList = {};

  Item item = Item(result: Result(count: 0, start: 0, rows: 0, items: []));
  String startYear = '';
  String finishYear = '';
  int startRecord = 0;

  String get currentSearchingYear => _currentSearchingYear;
  Set<Items> get items => _items;
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
    isFavorite: false,
    isSelected: false,
  );

  ItemListProvider({
    required this.favoritesRepo,
    required this.itemsRepo,
  });

  void setFilteredList({
    required bool onlyActualData,
    required bool onlyInvalidData,
    required String mitTitleFilter,
    required String mitNotation,
    required String orgTitle,
  }) {
    _filteredList = items.toList();
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
      _filteredList = items.toList();
    }

    notifyListeners();
  }

  Future<void> loadItemsList({
    required String userSearch,
    required String startYear,
    required String finishYear,
  }) async {
    _items.clear();
    _accurateList.clear();
    final intFinishYear = int.parse(finishYear);

    // for (_year = int.parse(startYear); _year <= intFinishYear; _year++) {
    _loadingState = true;
    _currentSearchingYear = _year.toString();

    if (startRecord == 0) {
      item = await getItem(userSearch, _year.toString(), 0) as Item;
      _items.addAll(item.result.items);
      if (item.result.count > 100) {
        startRecord = 100;
      }
    }
    if (item.result.count > 100) {
      for (; startRecord < item.result.count;) {
        item = await getItem(userSearch, _year.toString(), startRecord) as Item;
        _items.addAll(item.result.items);

        if (startRecord < item.result.count - 100 && startRecord != 0) {
          startRecord += 100;
        } else if (startRecord <= 0) {
          startRecord = item.result.count - 100;
        }
        log('startRecord:    ------------------' + startRecord.toString());
      }
    }

    final box = await Hive.openBox<bool>('accurateBox');
    var isAccurateSearchMode = true;
    if (box.isEmpty) {
      isAccurateSearchMode = true;
    } else {
      isAccurateSearchMode = box.get('accurateBox') as bool;
    }

    if (isAccurateSearchMode) {
      _accurateList.addAll(
        _items.where((element) => element.miNumber == search).toSet(),
      );
      _items.clear(); //activate it for accurate search
      if (_accurateList.isNotEmpty) {
        final accurateSet = await setElementsIsFavorite(_accurateList);
        _items.addAll(accurateSet);
      }
    } else {
      final rawSet = await setElementsIsFavorite(_items);
      _items.addAll(rawSet);
    }

    setFilteredList(
      onlyActualData: false,
      onlyInvalidData: false,
      mitNotation: '',
      mitTitleFilter: '',
      orgTitle: '',
    );

    _loadingState = false;

    //notifyListeners();
    // }

    notifyListeners();
  }

  void setSearchRequest(String searchRequest) {
    _search = searchRequest;
    notifyListeners();
  }

  void clearItemsList() {
    _loadingState = false;
    _filteredList = items.toList();
    notifyListeners();
  }

  Future getItem(String userSearch, String year, int record) async =>
      itemsRepo.getItem(search: search, startRecord: startRecord);

  Future<void> loadItemsByVriId({
    required String vriId,
  }) async {
    _loadingState = true;
    _itemByVriId = await getItemByVriId(vriId) as Items;
    _loadingState = false;

    notifyListeners();
  }

  Future<Items?> getItemByVriId(String vriId) async {
    var item = await itemsRepo.getItemByVriId(vriId: vriId);
    final setItems = <Items>{};
    if (item != null) {
      setItems.add(item);
      final rawSet = await setElementsIsFavorite(setItems);
      item = rawSet.first;
    }
    return item;
  }

  Future<Set<Items>> setElementsIsFavorite(Set<Items> itemsList) async {
    final favoritesList = await favoritesRepo.getFavoritesListFromStorage();
    if (favoritesList != null) {
      for (final i in itemsList) {
        for (final j in favoritesList) {
          if (i.vriId == j.vriId) {
            i.isFavorite = true;
          }
        }
      }
    }
    return itemsList;
  }
}
