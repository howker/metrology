import 'package:flutter/material.dart';
import 'package:infopoverka/data/favorites_repository.dart';
import 'package:infopoverka/models/item.dart';

class FavoritesProvider extends ChangeNotifier {
  final FavoritesRepository favoritesRepo;
  List<Items> get favoritesList {
    getFavoritesItems();
    return _favoritesList;
  }

  List<Items> _favoritesList = [];
  FavoritesProvider({required this.favoritesRepo});

  bool isFavorite(Items item) {
    return item.isFavorite;
  }

  Future<void> addItemToFavorites({required Items item}) async {
    item.isFavorite = true;
    await favoritesRepo.addItemToFavorites(item: item);

    notifyListeners();
  }

  Future<void> deleteItemFromFavorites({required Items item}) async {
    item.isFavorite = false;
    await favoritesRepo.deleteItemFromFavorites(item: item);

    notifyListeners();
  }

  Future<void> getFavoritesItems() async {
    final list = await favoritesRepo.getFavoritesListFromStorage();
    if (list != null && list.isNotEmpty) {
      _favoritesList = list;
    }

    notifyListeners();
  }
}
