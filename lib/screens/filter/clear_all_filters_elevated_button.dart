import 'package:flutter/material.dart';
import 'package:infopoverka/providers/filter_provider.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:infopoverka/utils/input_utils.dart';
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
        InputUtils.hideKeyboard();
        context.read<ItemListProvider>().setFilteredList(items);
        context.read<FilterProvider>().clearAllSwitcherAndFieldsStates();
      },
      child: const Text('Очистить все фильтры'),
    );
  }
}
