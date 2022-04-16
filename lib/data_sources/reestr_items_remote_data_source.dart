import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:infopoverka/data_sources/api_client.dart';
import 'package:infopoverka/locator_service.dart';
import 'package:infopoverka/models/item.dart';
import 'package:infopoverka/utils/ui_messages.dart';

class ReestrItemsRemoteDataSource {
  final apiClient = sl.get<ApiClient>();

  final List<Items> items = [];

  CancelToken token = CancelToken();

  Future<List<Items>?> getItems({
    required String search,
    required String year,
  }) async {
    try {
      apiClient.initInterceptors();
      final response = await apiClient.dio.get<dynamic>(
        'search=$search&year=$year',
        cancelToken: token,
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
      if (token.isCancelled) {
        token = CancelToken();
      }
      await UIMessages.showSimpleToast(e.message);

      return items;
    }
  }
}
