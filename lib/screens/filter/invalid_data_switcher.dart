import 'package:flutter/material.dart';
import 'package:infopoverka/providers/filter_provider.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:provider/provider.dart';

class InvalidDataSwitcher extends StatelessWidget {
  const InvalidDataSwitcher({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: context.watch<FilterProvider>().onlyInvalidDataSwitcherState,
      onChanged: (newValue) {
        context.read<FilterProvider>().setOnlyInvalidDataSwitcherState();

        context.read<ItemListProvider>().setFilteredList(
              onlyActualData:
                  context.read<FilterProvider>().onlyActualDataSwitcherState,
              onlyInvalidData:
                  context.read<FilterProvider>().onlyInvalidDataSwitcherState,
              mitTitleFilter:
                  context.read<FilterProvider>().mitTitleFormFieldText,
              mitNotation: context.read<FilterProvider>().mitNotationFieldText,
            );
      },
    );
  }
}
