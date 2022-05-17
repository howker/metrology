import 'package:hive_flutter/hive_flutter.dart';
import 'package:infopoverka/models/item.dart';
import 'package:infopoverka/utils/ui_messages.dart';

class LocalDataSource {
  List<Items> favoritesList = <Items>[];
  Future<List<Items>> getFavoritesListFromStorage() async {
    final itemsBox = await Hive.openBox<Items>('favorite_items');
    favoritesList = itemsBox.values.toList();

    return favoritesList;
  }

  Future<bool> addItemToFavorites({required Items item}) async {
    final itemsBox = await Hive.openBox<Items>('favorite_items');
    favoritesList = itemsBox.values.toList();

    for (var i = 0; i < favoritesList.length; i++) {
      if (favoritesList[i].vriId == item.vriId) {
        await UIMessages.showSimpleToast('СИ уже находится в избранном');
        return false;
      }
    }
    await itemsBox.add(item);
    return true;
  }

  Future<bool> deleteItemFromFavorites({required Items item}) async {
    final itemsBox = await Hive.openBox<Items>('favorite_items');

    favoritesList = itemsBox.values.toList();
    final keys = itemsBox.keys.toList();

    for (var i = 0; i < favoritesList.length; i++) {
      if (favoritesList[i] == item) {
        await itemsBox.delete(keys[i]);
      }
    }
    return true;
  }
}


//TODO добавить календарь ожидания проверки - поверено ли СИ? Показать локальное уведомление