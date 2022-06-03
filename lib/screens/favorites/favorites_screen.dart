import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:infopoverka/providers/favorites_provider.dart';
import 'package:infopoverka/providers/screen_provider.dart';
import 'package:infopoverka/providers/select_provider.dart';
import 'package:infopoverka/screens/favorites/favorites_screen_app_bar.dart';
import 'package:infopoverka/screens/search/item_card_widget.dart';
import 'package:infopoverka/screens/search/share_button.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesList = context.watch<FavoritesProvider>().favoritesList;
    if (context.watch<FavoritesProvider>().loadingState == true) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Lottie.asset('assets/animation/loading_indicator.json'),
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
          body: Center(
            child: Text(
              'Список избранного пуст',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
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
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 300),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Column(
                    children: [
                      ItemCard(item: favoritesList[index]),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
