import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:infopoverka/models/item.dart';
import 'package:infopoverka/providers/filter_provider.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:infopoverka/providers/visibility_provider.dart';
import 'package:infopoverka/utils/input_utils.dart';
import 'package:provider/provider.dart';

class OrgTitleFormField extends StatelessWidget {
  const OrgTitleFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onlyActualDataSwitcherState =
        context.watch<FilterProvider>().onlyActualDataSwitcherState;
    final onlyInvalidDataSwitcherState =
        context.watch<FilterProvider>().onlyInvalidDataSwitcherState;
    final typeAheadController = TextEditingController(
      text: context.watch<FilterProvider>().orgTitleFieldText,
    );
    final items = context.watch<ItemListProvider>().filteredList;
    return Visibility(
      visible: context.watch<VisibilityProvider>().orgTitleFormFieldVisibility,
      child: TypeAheadFormField<Items>(
        hideOnEmpty: true,
        noItemsFoundBuilder: (context) => const Text(''),
        textFieldConfiguration: TextFieldConfiguration(
          onTap: () =>
              context.read<VisibilityProvider>().mitOrgTitleFormSetActive(),
          onEditingComplete: () =>
              context.read<VisibilityProvider>().allFormsSetActive(),
          onSubmitted: (val) {
            InputUtils.hideKeyboard();
          },
          controller: typeAheadController,
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: 'Фильтровать по поверителю',
            border: OutlineInputBorder(),
          ),
        ),
        itemBuilder: (context, suggestion) {
          return Text(suggestion.orgTitle!);
        },
        onSuggestionSelected: (suggestion) {
          context
              .read<FilterProvider>()
              .setOrgTitleFieldText(suggestion.orgTitle!);

          context.read<ItemListProvider>().setFilteredList(
                onlyActualData: onlyActualDataSwitcherState,
                onlyInvalidData: onlyInvalidDataSwitcherState,
                mitTitleFilter: suggestion.mitTitle!,
                mitNotation: suggestion.mitNotation!,
                orgTitle: suggestion.orgTitle!,
              );
          context.read<VisibilityProvider>().allFormsSetActive();
        },
        suggestionsCallback: (pattern) {
          return items.where(
            (element) {
              if (element.orgTitle != null) {
                return element.orgTitle!.toLowerCase().contains(pattern);
              } else {
                return false;
              }
            },
          );
        },
      ),
    );
  }
}
