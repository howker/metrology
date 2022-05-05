import 'dart:io';

import 'package:path_provider/path_provider.dart';

class UserSettingsLocalDataSource {
  void getFavoriteListFromStorage() {
    return null;
  }
}

Future<File> saveDocument() async {
  const name = 'favorites_list';
  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/$name');

  await file.writeAsBytes([0]);

  return file;
}



//TODO добавить календарь ожидания проверки - поверено ли СИ? Показать локальное уведомление