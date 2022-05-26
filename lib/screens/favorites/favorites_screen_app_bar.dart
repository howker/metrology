import 'package:flutter/material.dart';
import 'package:infopoverka/providers/favorites_provider.dart';
import 'package:infopoverka/providers/screen_provider.dart';
import 'package:infopoverka/providers/select_provider.dart';
import 'package:provider/provider.dart';

class FavoritesScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  const FavoritesScreenAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedList = context.watch<SelectProvider>().selectedList;
    final items = context.watch<FavoritesProvider>().favoritesList;
    return AppBar(
      centerTitle: true,
      actions: [
        if (selectedList.isEmpty) const SizedBox.shrink(),
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
          //context.read<SelectProvider>().clearSelectedList();
          context.read<ScreenProvider>().setCurrentScreenIndex(0);
        },
      ),
      title: selectedList.isEmpty
          ? Text(
              'Избранное',
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            )
          : Text(selectedList.length.toString()),
    );
  }
}
