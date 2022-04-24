import 'package:flutter/material.dart';
import 'package:infopoverka/providers/filter_provider.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:provider/provider.dart';

class ActualDataSwitcher extends StatelessWidget {
  const ActualDataSwitcher({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: context.watch<FilterProvider>().onlyActualDataSwitcherState,
      onChanged: (newValue) {
        context.read<FilterProvider>().setOnlyActualDataSwitcherState();

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
