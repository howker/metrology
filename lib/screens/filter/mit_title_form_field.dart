import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:infopoverka/models/item.dart';
import 'package:infopoverka/providers/filter_provider.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:provider/provider.dart';

class MitTitleFormField extends StatelessWidget {
  const MitTitleFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final typeAheadController = TextEditingController(
      text: context.watch<FilterProvider>().mitTitleFormFieldText,
    );
    final items = context.watch<ItemListProvider>().filteredList;
    return TypeAheadFormField(
      hideOnEmpty: true,
      noItemsFoundBuilder: (context) => const Text(''),
      textFieldConfiguration: TextFieldConfiguration(
        controller: typeAheadController,
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          labelText: 'Фильтровать по типу СИ',
          border: OutlineInputBorder(),
        ),
      ),
      itemBuilder: (context, Items suggestion) {
        return Text(suggestion.mitTitle!);
      },
      onSuggestionSelected: (Items suggestion) {
        context
            .read<FilterProvider>()
            .setMitTitleFormFieldText(suggestion.mitTitle!);

        final userFilteredList = items
            .where(
              (element) => element.mitTitle == suggestion.mitTitle,
            )
            .toList();

        context.read<ItemListProvider>().setFilteredList(userFilteredList);
      },
      suggestionsCallback: (pattern) {
        return items.where(
          (element) => element.mitTitle!.toLowerCase().contains(pattern),
        );
      },
    );
  }
}
