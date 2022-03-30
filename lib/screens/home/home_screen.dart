import 'package:flutter/material.dart';
import 'package:infopoverka/key_packages.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:infopoverka/screens/search/search_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textEditingController = TextEditingController();
    var searchRequest = '';

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
              child: TextFormField(
                controller: textEditingController,
                onChanged: (text) {
                  searchRequest = text;
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              onPressed: () {
                context.read<ItemListProvider>().loadItemsList();
                final Route route = MaterialPageRoute<dynamic>(
                  builder: (context) => SearchScreen(
                    searchRequest: searchRequest,
                  ),
                );
                Navigator.push<void>(context, route);
              },
              icon: const Icon(Icons.search_rounded),
              label: const Text('Искать'),
            ),
          ],
        ),
      ),
    );
  }
}
