import 'package:flutter/material.dart';
import 'package:infopoverka/data_sources/reestr_items_remote_data_source.dart';
import 'package:infopoverka/locator_service.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:infopoverka/providers/select_provider.dart';
import 'package:infopoverka/screens/filter/filter_screen.dart';
import 'package:infopoverka/screens/search/empty_appbar.dart';
import 'package:infopoverka/screens/search/item_card_widget.dart';
import 'package:infopoverka/screens/search/loading_year_indicator.dart';
import 'package:infopoverka/screens/search/search_screen_appbar.dart';
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
      return const SafeArea(
        child: Scaffold(
          appBar: EmptyAppBar(),
          body: Center(
            child: Text('Ничего не найдено'),
          ),
        ),
      );
    } else {
      return Scaffold(
        floatingActionButton:
            context.watch<SelectProvider>().selectedList.isEmpty
                ? FloatingActionButton(
                    child: const Icon(Icons.filter_list_alt),
                    onPressed: () {
                      context.read<SelectProvider>().clearSelectedList();
                      final Route route = MaterialPageRoute<dynamic>(
                        builder: (context) => const FilterScreen(),
                      );
                      Navigator.push<dynamic>(context, route);
                    },
                  )
                : const SizedBox.shrink(),
        appBar: const SearchScreenAppBar(),
        body: ListView.builder(
          padding: const EdgeInsets.only(top: 5),
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ItemCard(item: items[index]),
              ],
            );
          },
        ),
      );
    }
  }
}
