import 'package:flutter/material.dart';
import 'package:infopoverka/providers/favorites_provider.dart';
import 'package:infopoverka/providers/screen_provider.dart';
import 'package:infopoverka/providers/select_provider.dart';
import 'package:infopoverka/screens/favorites/favorites_screen_app_bar.dart';
import 'package:infopoverka/screens/search/item_card_widget.dart';
import 'package:infopoverka/screens/search/share_button.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  static final tween = Tween<double>(begin: 0, end: 1);
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesList = context.watch<FavoritesProvider>().favoritesList;
    if (context.watch<FavoritesProvider>().loadingState == true) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    if (favoritesList.isEmpty) {
      return SafeArea(
        child: Scaffold(
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
        floatingActionButton:
            context.watch<SelectProvider>().selectedList.isEmpty
                ? const SizedBox.shrink()
                : const ShareButton(),
        appBar: const FavoritesScreenAppBar(),
        body: ListView.builder(
          padding: const EdgeInsets.only(top: 5),
          shrinkWrap: true,
          itemCount: favoritesList.length,
          itemBuilder: (context, index) {
            return TweenAnimationBuilder<double>(
              duration: const Duration(seconds: 1),
              tween: tween,
              builder: (_, value, __) {
                return Opacity(
                  opacity: value,
                  child: Column(
                    children: [
                      ItemCard(item: favoritesList[index]),
                    ],
                  ),
                );
              },
            );
          },
        ),
      );
    }
  }
}
