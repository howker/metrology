import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:infopoverka/models/item.dart';
import 'package:infopoverka/providers/favorites_provider.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatelessWidget {
  final Items item;

  const FavoriteButton({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    item.isFavorite = context.watch<FavoritesProvider>().isFavorite(item);
    return InkWell(
      onTap: () {
        if (!item.isFavorite) {
          context.read<FavoritesProvider>().addItemToFavorites(item: item);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Добавлено в избранное'),
          ));
        } else {
          context.read<FavoritesProvider>().deleteItemFromFavorites(item: item);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Удалено из избранного'),
          ));
        }
      },
      child: !item.isFavorite
          ? const Icon(
              Icons.star_outline_outlined,
              color: Colors.grey,
            )
          : const Icon(
              Icons.star,
              color: Colors.yellow,
            ),
    );
  }
}
