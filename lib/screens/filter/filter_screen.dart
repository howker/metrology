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
import 'package:infopoverka/screens/filter/mit_title_form_field.dart';
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
            children: const [
              ActualDataSwitcher(),
              Text('с актуальной поверкой'),
              Divider(thickness: 3),
              InvalidDataSwitcher(),
              Text('с просроченной поверкой'),
              MitTitleFormField(),
              ClearAllFiltersElevatedButton(),
            ],
          ),
        ),
      ),
    );
  }
}
