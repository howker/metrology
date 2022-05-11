import 'package:infopoverka/data_sources/local_data_source.dart';
import 'package:infopoverka/models/item.dart';

class FavoritesRepository {
  final LocalDataSource localDataSource;

  FavoritesRepository({required this.localDataSource});

  Future<List<Items>?> getFavoritesListFromStorage() async {
    try {
      final itemsList = await localDataSource.getFavoritesListFromStorage();
      return itemsList;
    } on Exception {
      return null;
    }
  }

  Future<bool> addItemToFavorites({required Items item}) async {
    try {
      await localDataSource.addItemToFavorites(item: item);
      return true;
    } on Exception {
      return false;
    }
  }
}
