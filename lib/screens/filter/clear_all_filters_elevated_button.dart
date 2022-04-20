import 'package:flutter/material.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:provider/provider.dart';

class ClearAllFiltersElevatedButton extends StatelessWidget {
  const ClearAllFiltersElevatedButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = context.watch<ItemListProvider>().items;
    return ElevatedButton(
      onPressed: () {
        context.read<ItemListProvider>().setFilteredList(items);
      },
      child: const Text('Очистить все фильтры'),
    );
  }
}
