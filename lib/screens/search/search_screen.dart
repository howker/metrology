import 'package:flutter/material.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:infopoverka/providers/select_provider.dart';
import 'package:infopoverka/screens/search/cancel_button.dart';
import 'package:infopoverka/screens/search/empty_appbar.dart';
import 'package:infopoverka/screens/search/filter_button.dart';
import 'package:infopoverka/screens/search/item_card_widget.dart';
import 'package:infopoverka/screens/search/loading_year_indicator.dart';
import 'package:infopoverka/screens/search/search_screen_appbar.dart';
import 'package:infopoverka/screens/search/share_button.dart';
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
          appBar: AppBar(),
          body: Center(
            child: Column(
              children: const [
                LoadingYearIndicator(),
                CircularProgressIndicator(),
                CancelButton(),
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
        floatingActionButtonLocation:
            context.watch<SelectProvider>().selectedList.isEmpty
                ? FloatingActionButtonLocation.centerFloat
                : FloatingActionButtonLocation.endFloat,
        floatingActionButton:
            context.watch<SelectProvider>().selectedList.isEmpty
                ? const FilterButton()
                : const ShareButton(),
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
