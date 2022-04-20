/*  Фильтры:
Только с актуальной поверкой
Только с просроченной поверкой
По типу СИ mit_title
По модификации СИ mit_notation
По поверителю org_title
 */

import 'package:flutter/material.dart';
import 'package:infopoverka/models/item.dart';
import 'package:infopoverka/providers/filter_switch_provider.dart';

import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:infopoverka/screens/filter/clear_all_filters_elevated_button.dart';
import 'package:infopoverka/utils/valid_data_check.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filteredList = context.watch<ItemListProvider>().filteredList;
    final onlyActualData =
        context.watch<FilterSwitchProvider>().onlyActualDataSwitcherState;

    var userFilteredList = <Items>[];

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text('Показать ${filteredList.length}'),
          onPressed: () {},
        ),
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Switch.adaptive(
                value: onlyActualData,
                onChanged: (newValue) {
                  context
                      .read<FilterSwitchProvider>()
                      .setOnlyActualDataSwitcherState();
                  if (onlyActualData) {
                    userFilteredList = filteredList
                        .where((element) =>
                            ValidDataCheck.validStatus(element.validDate ?? ''))
                        .toList();
                    context
                        .read<ItemListProvider>()
                        .setFilteredList(userFilteredList);
                  } else {
                    context
                        .read<ItemListProvider>()
                        .setFilteredList(filteredList);
                  }
                },
              ),
              const Text('с актуальной поверкой'),
              const Divider(thickness: 3),
              Switch.adaptive(
                value: false,
                onChanged: (newValue) {
                  // context
                  //     .read<ItemListProvider>()
                  //     .setFilteredList(userFilteredList);
                },
              ),
              const Text('с просроченной поверкой'),
              TextFormField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.blue),
                  label: Text(
                    'Фильтровать по типу СИ',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                onFieldSubmitted: (text) {},
                onEditingComplete: () {},
                onChanged: (text) {},
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.blue),
                  label: Text(
                    'Фильтровать по модификации СИ',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                onFieldSubmitted: (text) {},
                onEditingComplete: () {},
                onChanged: (text) {},
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.blue),
                  label: Text(
                    'Фильтровать по организации-поверителю',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                onFieldSubmitted: (text) {},
                onEditingComplete: () {},
                onChanged: (text) {},
              ),
              const ClearAllFiltersElevatedButton(),
            ],
          ),
        ),
      ),
    );
  }
}
