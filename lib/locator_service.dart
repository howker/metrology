import 'package:get_it/get_it.dart';
import 'package:infopoverka/data_sources/api_client.dart';

final sl = GetIt.instance;

void init() {
  sl.registerSingleton<ApiClient>(ApiClient());
}
