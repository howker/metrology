import 'package:infopoverka/data_sources/reestr_items_remote_data_source.dart';
import 'package:infopoverka/models/item.dart';

class ItemsRepository {
  final ReestrItemsRemoteDataSource reestrItemsRemoteDataSource;

  final Result result = Result(count: 0, items: [], rows: 0, start: 0);

  ItemsRepository({required this.reestrItemsRemoteDataSource});

  Future<Result> getResult({
    required String search,
    required String year,
    required int startRecord,
  }) async {
    try {
      final items = await reestrItemsRemoteDataSource.getResult(
        search: search,
        year: year,
        startRecord: startRecord,
      );
      return items;
    } on Exception {
      return result;
    }
  }
}
