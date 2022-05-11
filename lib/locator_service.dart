// ignore_for_file: cascade_invocations

import 'package:get_it/get_it.dart';
import 'package:infopoverka/data/favorites_repository.dart';
import 'package:infopoverka/data/items_repository.dart';
import 'package:infopoverka/data_sources/api_client.dart';
import 'package:infopoverka/data_sources/local_data_source.dart';
import 'package:infopoverka/data_sources/reestr_items_remote_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<ApiClient>(ApiClient.new);

  sl.registerSingleton<ReestrItemsRemoteDataSource>(
    ReestrItemsRemoteDataSource(),
  );
  sl.registerSingleton<LocalDataSource>(
    LocalDataSource(),
  );

  final reestrItemsRemoteDataSource = sl.get<ReestrItemsRemoteDataSource>();
  final localDataSource = sl.get<LocalDataSource>();

  sl.registerSingleton<ItemsRepository>(
    ItemsRepository(reestrItemsRemoteDataSource: reestrItemsRemoteDataSource),
  );

  sl.registerSingleton<FavoritesRepository>(
    FavoritesRepository(localDataSource: localDataSource),
  );
}
