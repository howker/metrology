import 'package:flutter/material.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:provider/provider.dart';

class ShowFloatingButton extends StatelessWidget {
  const ShowFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filteredList = context.watch<ItemListProvider>().filteredList;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: FloatingActionButton.extended(
          backgroundColor: Colors.green,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          label: filteredList.isNotEmpty
              ? Text('Показать ${filteredList.length}')
              : const Text('Ничего не найдено'),
          onPressed: () {
            if (filteredList.isNotEmpty) {
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}
