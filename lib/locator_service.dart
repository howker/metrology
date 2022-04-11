import 'package:get_it/get_it.dart';
import 'package:infopoverka/data/items_repository.dart';
import 'package:infopoverka/data_sources/api_client.dart';
import 'package:infopoverka/data_sources/reestr_items_remote_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<ApiClient>(ApiClient.new);

  sl.registerSingleton<ReestrItemsRemoteDataSource>(
    ReestrItemsRemoteDataSource(),
  );

  final reestrItemsRemoteDataSource = sl.get<ReestrItemsRemoteDataSource>();

  sl.registerSingleton<ItemsRepository>(
    ItemsRepository(reestrItemsRemoteDataSource: reestrItemsRemoteDataSource),
  );
}
