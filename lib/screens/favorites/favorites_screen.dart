import 'package:flutter/material.dart';
import 'package:infopoverka/providers/favorites_provider.dart';

import 'package:infopoverka/screens/search/item_card_widget.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesList = context.watch<FavoritesProvider>().favoritesList;
    if (favoritesList.isEmpty) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: const Center(
            child: Text('Список избранного пуст'),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          padding: const EdgeInsets.only(top: 5),
          shrinkWrap: true,
          itemCount: favoritesList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ItemCard(item: favoritesList[index]),
              ],
            );
          },
        ),
      );
    }
  }
}
