import 'package:flutter/material.dart';
import 'package:infopoverka/key_packages.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  final String searchRequest;

  const SearchScreen({
    required this.searchRequest,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = context.watch<ItemListProvider>().items;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Найдены результаты поверки СИ',
          style: AppTextStyles.kSFBody14,
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: items?.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(items?[index].orgTitle ?? ''),
            ],
          );
        },
      ),
    );
  }
}
