import 'package:flutter/material.dart';
import 'package:infopoverka/providers/favorites_provider.dart';
import 'package:infopoverka/providers/screen_provider.dart';
import 'package:infopoverka/screens/home/bottom_navi_bar.dart';

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
          bottomNavigationBar: const BottomNaviBar(),
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.read<ScreenProvider>().setCurrentScreenIndex(0);
              },
            ),
          ),
          body: const Center(
            child: Text('Список избранного пуст'),
          ),
        ),
      );
    } else {
      return Scaffold(
        bottomNavigationBar: const BottomNaviBar(),
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
