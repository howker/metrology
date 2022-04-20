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
    final items = context.watch<ItemListProvider>().items;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text('Показать ${items.length}'),
          onPressed: () {},
        ),
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Switch.adaptive(
                value: true,
                onChanged: (newValue) {},
              ),
              const Text('с актуальной поверкой'),
              const Divider(thickness: 3),
              Switch.adaptive(
                value: true,
                onChanged: (newValue) {},
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
