import 'package:flutter/material.dart';
import 'package:infopoverka/key_packages.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:infopoverka/providers/select_provider.dart';
import 'package:provider/provider.dart';

class SearchScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  const SearchScreenAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = context.watch<ItemListProvider>().filteredList;

    final selectedList = context.watch<SelectProvider>().selectedList;
    return AppBar(
      centerTitle: true,
      actions: [
        if (selectedList.isEmpty)
          const SizedBox.shrink()
        else
          IconButton(
            onPressed: () {
              context
                  .read<SelectProvider>()
                  .addAllItemsToSelectedList(itemsList: items);
            },
            icon: const Icon(Icons.checklist_rtl),
          ),
      ],
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          context.read<SelectProvider>().clearSelectedList();
          Navigator.pop(context);
        },
      ),
      title: selectedList.isEmpty
          ? Text(
              '${items.length}',
              style: AppTextStyles.kSFBody14,
            )
          : Text(selectedList.length.toString()),
    );
  }
}
