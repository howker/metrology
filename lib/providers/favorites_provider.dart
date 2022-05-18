import 'package:flutter/material.dart';
import 'package:infopoverka/data/favorites_repository.dart';
import 'package:infopoverka/models/item.dart';

class FavoritesProvider extends ChangeNotifier {
  final FavoritesRepository favoritesRepo;
  List<Items> get favoritesList => _favoritesList;
  bool get loadingState => _loadingState;

  List<Items> _favoritesList = [];
  bool _loadingState = false;
  FavoritesProvider({required this.favoritesRepo});

  bool isFavorite(Items item) {
    return item.isFavorite;
  }

  Future<void> addItemToFavorites({required Items item}) async {
    item.isFavorite = true;
    await favoritesRepo.addItemToFavorites(item: item);
    await getFavoritesItems();
    notifyListeners();
  }

  Future<void> deleteItemFromFavorites({required Items item}) async {
    item.isFavorite = false;
    await favoritesRepo.deleteItemFromFavorites(item: item);
    await getFavoritesItems();
    notifyListeners();
  }

  Future<void> getFavoritesItems() async {
    _loadingState = true;
    final list = await favoritesRepo.getFavoritesListFromStorage();
    if (list != null) {
      _favoritesList = list;
    }
    _loadingState = false;
    notifyListeners();
  }
}
