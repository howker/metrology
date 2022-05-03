import 'package:infopoverka/data_sources/reestr_items_remote_data_source.dart';
import 'package:infopoverka/models/item.dart';

class ItemsRepository {
  final ReestrItemsRemoteDataSource reestrItemsRemoteDataSource;

  Item item = Item(result: Result(count: 0, start: 0, rows: 0, items: []));

  ItemsRepository({required this.reestrItemsRemoteDataSource});

  Future<Item> getItem({
    required String search,
    required String year,
    required int startRecord,
  }) async {
    try {
      final item = await reestrItemsRemoteDataSource.getItem(
        search: search,
        year: year,
        startRecord: startRecord,
      );
      return item;
    } on Exception {
      return item;
    }
  }

  Future<Item> getItemByVriId({
    required String vriId,
  }) async {
    try {
      final item = await reestrItemsRemoteDataSource.getItemByVriId(
        vriId: vriId,
      );
      return item;
    } on Exception {
      return item;
    }
  }
}
