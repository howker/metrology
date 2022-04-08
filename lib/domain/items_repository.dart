import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:infopoverka/main.dart';
import 'package:infopoverka/models/item.dart';
import 'package:infopoverka/utils/ui_messages.dart';

class ItemsRepository {
  final List<Items> items = [];
  Future<List<Items>?> getItems({
    required String search,
    required String year,
  }) async {
    try {
      final response = await dio.get<dynamic>(
        'search=$search&year=$year',
        //cancelToken: token,
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
    } on DioError catch (e) {
      await UIMessages.showSimpleToast(e.message);

      return items;
    }
  }
}
