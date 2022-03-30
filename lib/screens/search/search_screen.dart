import 'package:flutter/material.dart';
import 'package:infopoverka/key_packages.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:infopoverka/screens/search/item_card_widget.dart';
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
    if (context.watch<ItemListProvider>().loadingState == true) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (items != null && items.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.read<ItemListProvider>().clearItemsList();
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'результаты поиска',
            style: AppTextStyles.kSFBody14,
          ),
        ),
        body: const Center(
          child: Text('Ничего не найдено'),
        ),
      );
    } else if (items != null) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Найдены результаты поверки СИ',
            style: AppTextStyles.kSFBody14,
          ),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ItemCard(
                  applicability: items[index].applicability ?? false,
                  vriId: items[index].vriId,
                  orgTitle: items[index].orgTitle,
                  mitNumber: items[index].miNumber,
                  mitTitle: items[index].mitTitle,
                  mitNotation: items[index].mitNotation,
                  miModification: items[index].miModification,
                  miNumber: items[index].miNumber,
                  verificationDate: items[index].verificationDate,
                  validDate: items[index].validDate,
                  resultDocnum: items[index].resultDocnum,
                ),
              ],
            );
          },
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
