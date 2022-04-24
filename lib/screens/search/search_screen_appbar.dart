import 'package:flutter/material.dart';
import 'package:infopoverka/key_packages.dart';

class SearchScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  const SearchScreenAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.checklist_rtl),
        ),
      ],
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Text(
        'Найдены результаты поверки СИ',
        style: AppTextStyles.kSFBody14,
      ),
    );
  }
}
