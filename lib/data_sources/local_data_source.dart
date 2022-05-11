import 'package:hive_flutter/hive_flutter.dart';
import 'package:infopoverka/models/item.dart';

class LocalDataSource {
  Future<List<Items>> getFavoritesListFromStorage() async {
    var favoritesList = <Items>[];
    final itemsBox = await Hive.openBox<Items>('favorite_items');
    favoritesList = itemsBox.values.toList();

    return favoritesList;
  }

  Future<bool> addItemToFavorites({required Items item}) async {
    final itemsBox = await Hive.openBox<Items>('favorite_items');
    await itemsBox.add(item);
    return true;
  }

  Future<bool> deleteItemFromFavorites({required Items item}) async {
    final itemsBox = await Hive.openBox<Items>('favorite_items');
    await itemsBox.delete(item);
    return true;
  }
}





//TODO добавить календарь ожидания проверки - поверено ли СИ? Показать локальное уведомление