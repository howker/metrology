import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:infopoverka/data_sources/api_client.dart';
import 'package:infopoverka/locator_service.dart';
import 'package:infopoverka/models/item.dart';
import 'package:infopoverka/utils/ui_messages.dart';

class ReestrItemsRemoteDataSource {
  final apiClient = sl.get<ApiClient>();

  Result result = Result(count: 0, items: [], rows: 0, start: 0);

  CancelToken token = CancelToken();

  Future<Result> getResult({
    required String search,
    required String year,
    required int startRecord,
  }) async {
    try {
      apiClient.initInterceptors();
      final response = await apiClient.dio.get<dynamic>(
        'search=$search&year=$year&start=$startRecord',
        cancelToken: token,
        onReceiveProgress: (count, total) =>
            // ignore: avoid_print
            print('Count...: $count ---------- Total:$total'),
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        result = Result.fromJson(
          json.decode(response.toString()) as Map<String, dynamic>,
        );
      }
    } on DioError catch (e) {
      if (token.isCancelled) {
        token = CancelToken();
      }
      await UIMessages.showSimpleToast(e.message);
      return result;
    }
    return result;
  }
}
