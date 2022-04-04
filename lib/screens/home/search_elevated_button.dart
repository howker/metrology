import 'package:flutter/material.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:infopoverka/screens/search/search_screen.dart';
import 'package:provider/provider.dart';

class SearchElevatedButton extends StatelessWidget {
  final String searchRequest;

  const SearchElevatedButton({
    required this.searchRequest,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        context.read<ItemListProvider>().clearItemsList();

        //получить даты через провайдер

        //цикл с по

        //в цикле управлять состоянием загрузки меняя года поиска

        context.read<ItemListProvider>().loadItemsList(searchRequest);
        final Route route = MaterialPageRoute<dynamic>(
          builder: (context) => SearchScreen(
            searchRequest: searchRequest,
          ),
        );
        Navigator.push<void>(context, route);
      },
      icon: const Icon(Icons.search_rounded),
      label: const Text('Искать'),
    );
  }
}
