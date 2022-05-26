import 'package:flutter/material.dart';
import 'package:infopoverka/providers/favorites_provider.dart';
import 'package:infopoverka/providers/screen_provider.dart';
import 'package:provider/provider.dart';

class BottomNaviBar extends StatelessWidget {
  const BottomNaviBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index = context.watch<ScreenProvider>().currentScreenIndex;

    return NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: Colors.blue.shade100,
        labelTextStyle: MaterialStateProperty.all(
          Theme.of(context).textTheme.headline2,
        ),
      ),
      child: NavigationBar(
        selectedIndex: index,
        height: 60,
        //labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (selectedIndex) {
          context.read<FavoritesProvider>().getFavoritesItems();
          context.read<ScreenProvider>().setCurrentScreenIndex(selectedIndex);
        },
        animationDuration: const Duration(seconds: 3),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Главная',
            selectedIcon: Icon(Icons.home),
          ),
          NavigationDestination(
            icon: Icon(Icons.star_outline),
            label: 'Избранное',
            selectedIcon: Icon(Icons.star),
          ),
        ],
      ),
    );
  }
}

//TODO сделать боттом нави бар с вырезом