import 'package:flutter/material.dart';
import 'package:infopoverka/data/favorites_repository.dart';
import 'package:infopoverka/models/item.dart';

class FavoritesProvider extends ChangeNotifier {
  final FavoritesRepository favoritesRepo;
  final List<Items> _favoritesList = [];
  List<Items> get favoritesList => _favoritesList;

  FavoritesProvider({required this.favoritesRepo});

  Future<void> addItemToFavorites({required Items item}) async {
    item.isFavorite = true;
    await favoritesRepo.addItemToFavorites(item: item);
    await getFavoritesItems();
    notifyListeners();
  }

  Future<void> deleteItemFromFavorites({required Items item}) async {
    item.isFavorite = false;
//    await favoritesRepo.addItemToFavorites(item: item);
    await getFavoritesItems();
    notifyListeners();
  }

  Future<void> getFavoritesItems() async {
    final list = await favoritesRepo.getFavoritesListFromStorage();
    if (list != null && list.isNotEmpty) {
      _favoritesList.addAll(list);
    }

    notifyListeners();
  }
  // Future<Items?> getItemByVriId(String vriId) async =>
  //     itemsRepo.getItemByVriId(vriId: vriId);
}
