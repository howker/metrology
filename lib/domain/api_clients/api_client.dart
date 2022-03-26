import 'dart:io';

import 'package:infopoverka/models/item.dart';

class ApiClient {
  final client = HttpClient();

  Future<Item> getItems(String search) async {
    final queryParameters = {
      'search': search,
    };
    final url = Uri(
      scheme: 'https',
      host: 'https://fgis.gost.ru/fundmetrology/eapi',
      path: 'vri',
      queryParameters: queryParameters,
    );
    final request = await client.getUrl(url);
    final response = await request.close();
    if (response.statusCode == 200) {
      return Item.fromJson(response);
    } else {
      throw Exception(response.statusCode);
    }
  }
}
