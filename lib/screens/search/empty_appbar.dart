import 'package:flutter/material.dart';
import 'package:infopoverka/key_packages.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:provider/provider.dart';

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);
  const EmptyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          context.read<ItemListProvider>().clearItemsList();
          Navigator.pop(context);
        },
      ),
      title: const Text(
        'результаты поиска',
        style: AppTextStyles.kSFBody14,
      ),
    );
  }
}
