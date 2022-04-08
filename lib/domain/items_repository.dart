import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:infopoverka/domain/dio_base_options.dart';
import 'package:infopoverka/models/item.dart';

class ItemsRepository {
  final dio = Dio(baseOptions);

  Future<List<Items>> getItems({
    required String search,
    required String year,
  }) async {
    initInterceptors();
    final response = await dio.get<dynamic>(
      'search=$search&year=$year',
      onReceiveProgress: (count, total) =>
          // ignore: avoid_print
          print('Count...: $count ---------- Total:$total'),
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      final item = Item.fromJson(
        json.decode(response.toString()) as Map<String, dynamic>,
      );

      final itemsList = item.result.items;

      final accurateList =
          itemsList.where((element) => element.miNumber == search).toList();

      return accurateList;
    } else {
      throw Exception('HTTP request error: ${response.statusCode}');
    }
  }

  void initInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // ignore: avoid_print
          print(
            'Request is sending: ${options.method} ${options.baseUrl}${options.path}',
          );
          return handler.next(options);
        },
        onResponse: (responce, handler) {
          //print('Answer was received: ${responce.data}');
          return handler.next(responce);
        },
        onError: (error, handler) {
          // ignore: avoid_print
          print('It was error: $error');
        },
      ),
    );
  }
}
