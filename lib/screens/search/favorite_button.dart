import 'package:flutter/material.dart';
import 'package:infopoverka/models/item.dart';
import 'package:infopoverka/providers/buttons_provider.dart';
import 'package:infopoverka/providers/favorites_provider.dart';
import 'package:infopoverka/screens/search/favorite_icon.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatelessWidget {
  static final tween = Tween<double>(begin: 0, end: 10);
  final Items item;

  const FavoriteButton({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    item.isFavorite = context.watch<FavoritesProvider>().isFavorite(item);
    return AbsorbPointer(
      absorbing: context.watch<ButtonsProvider>().isFavoriteButtonActive,
      child: InkWell(
        onTap: () {
          context.read<ButtonsProvider>().favoriteButtonClicked();
          if (!item.isFavorite) {
            context.read<FavoritesProvider>().addItemToFavorites(item: item);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Добавлено в избранное'),
              duration: Duration(milliseconds: 600),
            ));
          } else {
            context
                .read<FavoritesProvider>()
                .deleteItemFromFavorites(item: item);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Удалено из избранного'),
              duration: Duration(milliseconds: 600),
            ));
          }
        },
        child: FavoriteIcon(isFavorite: !item.isFavorite),
      ),
    );
  }
}
