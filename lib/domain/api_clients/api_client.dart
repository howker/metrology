import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:infopoverka/models/item.dart';

class ApiClient {
  final client = HttpClient();

  Future<dynamic> getItems({required String search}) async {
    final queryParameters = {
      'search': search,
    };
    final url = Uri(
      scheme: 'https',
      host: 'fgis.gost.ru',
      path: 'fundmetrology/eapi/vri',
      queryParameters: queryParameters,
    );
    final request = await client.getUrl(url);
    final response = await request.close();
    if (response.statusCode == 200) {
      final jsonStrings = await response.transform(utf8.decoder).toList();
      final jsonString = jsonStrings.join();
      final dynamic json = jsonDecode(jsonString);

      // ignore: avoid_print
      print('ok');
      return items;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
