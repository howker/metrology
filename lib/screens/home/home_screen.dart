import 'package:flutter/material.dart';
import 'package:infopoverka/domain/items_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsRepository()
        .getItems(search: '01110425', year: '2020'); //TODO delete it

    return const Scaffold();
  }
}
