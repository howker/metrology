/*  Фильтры:
Только с актуальной поверкой
Только с просроченной поверкой
По типу СИ mit_title
По модификации СИ mit_notation
По поверителю org_title
 */

import 'package:flutter/material.dart';

import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var filteredList = context.watch<ItemListProvider>().filteredList;
    var onlyActualData = false;

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
                  onlyActualData = newValue;
                  filteredList.where((element) => false);
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
            ],
          ),
        ),
      ),
    );
  }
}
