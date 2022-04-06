import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:infopoverka/models/item.dart';

class ItemsRepository {
  Future<List<Items>> getItems({
    required String search,
    required String year,
  }) async {
    final url = Uri.parse(
      'https://fgis.gost.ru/fundmetrology/eapi/vri?search=$search&year=$year',
    );
    final response = await http.get(
      url,
    );
//TODO add try catch

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final item =
          Item.fromJson(json.decode(response.body) as Map<String, dynamic>);

      final itemsList = item.result.items;

      final accurateList =
          itemsList.where((element) => element.miNumber == search).toList();

      return accurateList;
    } else {
      //TODO implement Exceptions catch (e.g. too many requests)
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }
}
