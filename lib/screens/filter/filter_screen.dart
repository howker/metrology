/*  Фильтры:
Только с актуальной поверкой
Только с просроченной поверкой
По типу СИ mit_title
По модификации СИ mit_notation
По поверителю org_title
 */

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:infopoverka/models/item.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:infopoverka/screens/filter/actual_data_switcher.dart';
import 'package:infopoverka/screens/filter/clear_all_filters_elevated_button.dart';
import 'package:infopoverka/screens/filter/invalid_data_switcher.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = context.watch<ItemListProvider>().filteredList;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          child: Text('Показать ${items.length}'),
          onPressed: () {},
        ),
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const ActualDataSwitcher(),
              const Text('с актуальной поверкой'),
              const Divider(thickness: 3),
              const InvalidDataSwitcher(),
              const Text('с просроченной поверкой'),
              TypeAheadField(
                noItemsFoundBuilder: (context) => const Text(''),
                textFieldConfiguration: TextFieldConfiguration(
                  style: Theme.of(context).textTheme.bodyLarge,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    label: Text(
                      'Фильтровать по типу СИ',
                      style: TextStyle(color: Colors.blue),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                itemBuilder: (context, Items suggestion) {
                  return Text(suggestion.mitTitle!);
                },
                onSuggestionSelected: (Items suggestion) {
                  log(suggestion.mitTitle!);
                  final userFilteredList = items
                      .where(
                        (element) => element.mitTitle == suggestion.mitTitle,
                      )
                      .toList();

                  context
                      .read<ItemListProvider>()
                      .setFilteredList(userFilteredList);
                },
                suggestionsCallback: (pattern) {
                  final emptyList = <Items>[];
                  if (pattern != '') {
                    return items.where(
                      (element) =>
                          element.mitTitle!.toLowerCase().contains(pattern),
                    );
                  } else {
                    return emptyList;
                  }
                },
              ),
              const ClearAllFiltersElevatedButton(),
            ],
          ),
        ),
      ),
    );
  }
}
