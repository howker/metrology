import 'package:flutter/material.dart';
import 'package:infopoverka/data_sources/reestr_items_remote_data_source.dart';
import 'package:infopoverka/key_packages.dart';
import 'package:infopoverka/locator_service.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:infopoverka/screens/filter/filter_screen.dart';
import 'package:infopoverka/screens/search/item_card_widget.dart';
import 'package:infopoverka/screens/search/loading_year_indicator.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = context.watch<ItemListProvider>().filteredList;

    if (context.watch<ItemListProvider>().loadingState == true) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(), // TODO(me): add check all for sharing
          body: Center(
            child: Column(
              children: [
                const LoadingYearIndicator(),
                const CircularProgressIndicator(),
                ElevatedButton(
                  onPressed: () {
                    sl
                        .get<ReestrItemsRemoteDataSource>()
                        .token
                        .cancel('Запрос отменён');
                  },
                  child: const Text('CANCEL'),
                ),
              ],
            ),
          ), //
        ),
      );
    }
    if (items.isEmpty) {
      return SafeArea(
        child: Scaffold(
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
        ),
      );
    } else {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.filter_list_alt),
          onPressed: () {
            final Route route = MaterialPageRoute<dynamic>(
              builder: (context) => const FilterScreen(),
            );
            Navigator.push<dynamic>(context, route);
          },
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.checklist_rtl),
            ),
          ],
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
          padding: const EdgeInsets.only(top: 5),
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ItemCard(
                  applicability: items[index].applicability ?? false,
                  vriId: items[index].vriId ?? '',
                  orgTitle: items[index].orgTitle ?? '',
                  mitNumber: items[index].miNumber ?? '',
                  mitTitle: items[index].mitTitle ?? '',
                  mitNotation: items[index].mitNotation ?? '',
                  miModification: items[index].miModification ?? '',
                  miNumber: items[index].miNumber ?? '',
                  verificationDate: items[index].verificationDate ?? '',
                  validDate: items[index].validDate ?? '',
                  resultDocnum: items[index].resultDocnum ?? '',
                ),
              ],
            );
          },
        ),
      );
    }
  }
}
