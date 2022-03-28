import 'package:flutter/material.dart';
import 'package:infopoverka/key_packages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  ItemsRepository()
    //     .getItems(search: '01110425', year: '2020'); // TODO(sergey): delete it

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Поиск сведений о результатах поверки СИ',
          style: AppTextStyles.kSFBody14,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              height: 40,
              width: double.infinity,
              child: TextFormField(),
            ),
          ],
        ),
      ),
    );
  }
}
