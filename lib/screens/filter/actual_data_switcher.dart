import 'package:flutter/material.dart';
import 'package:infopoverka/models/item.dart';
import 'package:infopoverka/providers/filter_switch_provider.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:infopoverka/utils/valid_data_check.dart';
import 'package:provider/provider.dart';

class ActualDataSwitcher extends StatelessWidget {
  const ActualDataSwitcher({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = context.watch<ItemListProvider>().items;
    final filteredList = context.watch<ItemListProvider>().filteredList;
    var userFilteredList = <Items>[];

    return Switch.adaptive(
      value: context.read<FilterSwitchProvider>().onlyActualDataSwitcherState,
      onChanged: (newValue) {
        context.read<FilterSwitchProvider>().setOnlyActualDataSwitcherState();
        if (context.read<FilterSwitchProvider>().onlyActualDataSwitcherState) {
          userFilteredList = filteredList
              .where((element) =>
                  ValidDataCheck.validStatus(element.validDate ?? ''))
              .toList();
          context.read<ItemListProvider>().setFilteredList(userFilteredList);
        } else {
          context.read<ItemListProvider>().setFilteredList(items);
        }
      },
    );
  }
}
