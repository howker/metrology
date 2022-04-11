import 'package:infopoverka/data_sources/reestr_items_remote_data_source.dart';
import 'package:infopoverka/models/item.dart';

class ItemsRepository {
  final ReestrItemsRemoteDataSource reestrItemsRemoteDataSource;

  final List<Items> items = [];

  ItemsRepository({required this.reestrItemsRemoteDataSource});

  Future<List<Items>?> getItems({
    required String search,
    required String year,
  }) async {
    try {
      final items = await reestrItemsRemoteDataSource.getItems(
        search: search,
        year: year,
      );
      return items;
    } on Exception {
      return items;
    }
  }
}
