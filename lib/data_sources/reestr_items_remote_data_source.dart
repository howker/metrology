import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:infopoverka/data_sources/api_client.dart';
import 'package:infopoverka/locator_service.dart';
import 'package:infopoverka/models/element.dart';
import 'package:infopoverka/models/item.dart';
import 'package:infopoverka/utils/ui_messages.dart';

class ReestrItemsRemoteDataSource {
  final apiClient = sl.get<ApiClient>();

  Item item = Item(result: Result(count: 0, items: [], rows: 0, start: 0));

  CancelToken token = CancelToken();

  Future<Item> getItem({
    required String search,
    // required String year,
    required int startRecord,
  }) async {
    try {
      apiClient.initInterceptors();
      final response = await apiClient.dio.get<dynamic>(
        //TODO вернуть строку когда исправят на бэке
        //'vri?rows=100&search=$search&year=$year&start=$startRecord',
        'vri?rows=100&search=$search&start=$startRecord', //Временно
        cancelToken: token,
        onReceiveProgress: (count, total) =>
            log('Count...: $count ---------- Total:$total'),
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        item = Item.fromJson(
          json.decode(response.toString()) as Map<String, dynamic>,
        );
      }
    } on DioError catch (e) {
      if (token.isCancelled) {
        token = CancelToken();
      }
      await UIMessages.showSimpleToast(e.message);

      return item;
    }
    return item;
  }

  Future<Items?> getItemByVriId({
    required String vriId,
  }) async {
    try {
      apiClient.initInterceptors();
      final response = await apiClient.dio.get<dynamic>(
        'vri/$vriId',
        cancelToken: token,
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final element = Element.fromJson(
          json.decode(response.toString()) as Map<String, dynamic>,
        );
        final items = Items(
          vriId: vriId,
          orgTitle: element.result.vriInfo.organization ?? '',
          mitNumber: element.result.miInfo.singleMI.mitypeNumber ?? '',
          mitTitle: element.result.miInfo.singleMI.mitypeTitle ?? '',
          mitNotation: element.result.miInfo.singleMI.mitypeType ?? '',
          miModification: element.result.miInfo.singleMI.modification ?? '',
          miNumber: element.result.miInfo.singleMI.manufactureNum ?? '',
          verificationDate: element.result.vriInfo.vrfDate ?? '',
          validDate: element.result.vriInfo.validDate ?? '',
          resultDocnum: element.result.vriInfo.applicable?.certNum ?? '',
          applicability: element.result.vriInfo.applicable?.certNum != '',
          isFavorite: false,
          isSelected: false,
        );
        return items;
      }
    } on DioError catch (e) {
      if (token.isCancelled) {
        token = CancelToken();
      }
      await UIMessages.showSimpleToast(e.message);
    }
    return null;
  }
}
