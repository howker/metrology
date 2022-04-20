import 'package:flutter/material.dart';
import 'package:infopoverka/providers/data_range_provider.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:infopoverka/screens/search/search_screen.dart';
import 'package:infopoverka/utils/input_utils.dart';
import 'package:provider/provider.dart';

class SearchElevatedButton extends StatelessWidget {
  const SearchElevatedButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchRequest = context.watch<ItemListProvider>().search;
    final startDate = context.watch<DataRangeProvider>().startDateValue;
    final finishDate = context.watch<DataRangeProvider>().finishDateValue;

    return ElevatedButton.icon(
      onPressed: () {
        InputUtils.unFocus();

        context.read<ItemListProvider>().clearItemsList();

        context.read<ItemListProvider>().loadItemsList(
              userSearch: searchRequest,
              startYear: startDate,
              finishYear: finishDate,
              startRecord: 0,
            );

        final Route route = MaterialPageRoute<dynamic>(
          builder: (context) => const SearchScreen(),
        );
        Navigator.push<void>(context, route);
      },
      icon: const Icon(Icons.search_rounded),
      label: const Text('Искать'),
    );
  }
}
