import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const LoadingYearIndicator(),
                const Spacer(),
                CircularProgressIndicator(
                  color: Colors.green.shade900,
                ),
                const Spacer(),
                const CancelButton(),
                const Spacer(),
              ],
            ),
          ), //
        ),
      );
    }
    if (items.isEmpty) {
      return SafeArea(
        child: Scaffold(
          appBar: const EmptyAppBar(),
          body: Center(
            child: Text(
              'Ничего не найдено',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
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
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 100),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(child: ItemCard(item: items[index])),
              ),
            );
          },
        ),
      );
    }
  }
}
