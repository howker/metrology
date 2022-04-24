import 'package:flutter/material.dart';
import 'package:infopoverka/providers/filter_provider.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:infopoverka/utils/input_utils.dart';
import 'package:provider/provider.dart';

class ClearAllFiltersTextButton extends StatelessWidget {
  const ClearAllFiltersTextButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        InputUtils.hideKeyboard();

        context.read<FilterProvider>().clearAllSwitcherAndFieldsStates();
        context.read<ItemListProvider>().setFilteredList(
              onlyActualData:
                  context.read<FilterProvider>().onlyActualDataSwitcherState,
              onlyInvalidData:
                  context.read<FilterProvider>().onlyInvalidDataSwitcherState,
              mitTitleFilter: '',
              mitNotation: '',
              orgTitle: '',
            );
      },
      child: const Text('Очистить все фильтры'),
    );
  }
}
