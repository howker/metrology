import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:infopoverka/models/item.dart';

class ItemsRepository {
  Future<List<Items>> getItems({
    required String search,
  }) async {
    final url = Uri.parse(
      'https://fgis.gost.ru/fundmetrologytest/eapi/vri?search=$search', //&year=2020
    );
    final response = await http.get(
      url,
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final item =
          Item.fromJson(json.decode(response.body) as Map<String, dynamic>);

      final itemsList = item.result.items;

      return itemsList;
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }
}
