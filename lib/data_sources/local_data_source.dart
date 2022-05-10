import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:infopoverka/models/item.dart';
import 'package:infopoverka/models/items_hive_adapter.dart';
import 'package:path_provider/path_provider.dart';

class LocalDataSource {
  void hiveInit() {
    Hive.registerAdapter(ItemsHiveAdapter());
  }

  Future<List<Items>> getFavoritesListFromStorage() async {
    List<Items> favoritesList = [];
    final itemsBox = await Hive.openBox<Items>('favorite_items');
    itemsBox.keys;
    return favoritesList;
  }

  Future<void> addItemToFavorites({required Items item}) async {
    final itemsBox = await Hive.openBox<Items>('favorite_items');
    await itemsBox.add(item);
  }
}

// Future<File> saveFile() async {
//   const name = 'name';
//   final dir = await getApplicationDocumentsDirectory();
//   final file = File('${dir.path}/$name');

//   await file.writeAsBytes([0]);

//   return file;
// }



//TODO добавить календарь ожидания проверки - поверено ли СИ? Показать локальное уведомление