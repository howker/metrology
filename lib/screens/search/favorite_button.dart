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
    return InkWell(
      onTap: () {
        if (!item.isFavorite) {
          context.read<FavoritesProvider>().addItemToFavorites(item: item);
          context.read<FavoritesProvider>().isFavoriteToggle(item: item);
        } else {
          context.read<FavoritesProvider>().deleteItemFromFavorites(item: item);
          context.read<FavoritesProvider>().isFavoriteToggle(item: item);
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
