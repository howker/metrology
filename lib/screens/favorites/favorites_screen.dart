import 'package:flutter/material.dart';
import 'package:infopoverka/screens/home/bottom_navi_bar.dart';
import 'package:infopoverka/screens/search/item_card_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: const BottomNaviBar(),
        body: Center(child: Text('favorites')),

        // ListView.builder(
        //   itemBuilder: (context, index) {
        //     return Container();
        //     // ItemCard( item: null, );
        //   },
        // ),
      ),
    );
  }
}
