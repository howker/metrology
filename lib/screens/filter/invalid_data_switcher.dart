import 'package:flutter/material.dart';
import 'package:infopoverka/models/item.dart';
import 'package:infopoverka/providers/filter_provider.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:infopoverka/utils/valid_data_check.dart';
import 'package:provider/provider.dart';

class InvalidDataSwitcher extends StatelessWidget {
  const InvalidDataSwitcher({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = context.watch<ItemListProvider>().filteredList;
    var userFilteredList = <Items>[];

    return Switch.adaptive(
      value: context.read<FilterProvider>().onlyInvalidDataSwitcherState,
      onChanged: (newValue) {
        context.read<FilterProvider>().setOnlyInvalidDataSwitcherState();
        if (context.read<FilterProvider>().onlyInvalidDataSwitcherState) {
          userFilteredList = items
              .where((element) => !ValidDataCheck.validStatus(
                    element.validDate ?? '',
                  ))
              .toList();
          context.read<ItemListProvider>().setFilteredList(userFilteredList);
        } else {
          context.read<ItemListProvider>().setFilteredList(items);
        }
      },
    );
  }
}
