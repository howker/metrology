import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:infopoverka/models/item.dart';

class LocalDataSource {
  List<Items> favoritesList = <Items>[];
  Future<List<Items>> getFavoritesListFromStorage() async {
    final itemsBox = await Hive.openBox<Items>('favorite_items');
    favoritesList = itemsBox.values.toList();

    return favoritesList;
  }

  Future<bool> addItemToFavorites({required Items item}) async {
    final itemsBox = await Hive.openBox<Items>('favorite_items');
    if (!itemsBox.values.contains(item)) {
      await itemsBox.add(item);
      favoritesList = itemsBox.values.toList();

      return true;
    }
    return false;
  }

  Future<bool> deleteItemFromFavorites({required Items item}) async {
    final itemsBox = await Hive.openBox<Items>('favorite_items');

    favoritesList = itemsBox.values.toList();
    final keys = itemsBox.keys.toList();
    log(keys.toString());
    for (var i = 0; i < favoritesList.length; i++) {
      if (favoritesList[i] == item) {
        await itemsBox.delete(keys[i]);
        //await itemsBox.deleteAt(i);
        log('deleted : ${keys[i]}');
      }
    }

    log(itemsBox.keys.toString());

    return true;
  }
}





//TODO добавить календарь ожидания проверки - поверено ли СИ? Показать локальное уведомление