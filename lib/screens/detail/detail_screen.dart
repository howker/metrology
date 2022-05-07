import 'package:flutter/material.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:infopoverka/providers/select_provider.dart';
import 'package:infopoverka/screens/search/empty_appbar.dart';
import 'package:infopoverka/screens/search/item_card_widget.dart';
import 'package:infopoverka/screens/search/share_button.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = context.watch<ItemListProvider>().itemByVriId;

    if (context.watch<ItemListProvider>().loadingState == true) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              children: const [
                CircularProgressIndicator(),
              ],
            ),
          ), //
        ),
      );
    }
    if (items == null) {
      return const SafeArea(
        child: Scaffold(
          appBar: EmptyAppBar(),
          body: Center(
            child: Text('Ничего не найдено'),
          ),
        ),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.read<SelectProvider>().clearSelectedList();
                Navigator.pop(context);
              },
            ),
          ),
          floatingActionButton:
              context.watch<SelectProvider>().selectedList.isEmpty
                  ? const SizedBox.shrink()
                  : const ShareButton(),
          body: Column(
            children: [
              ItemCard(item: items),
            ],
          ),
        ),
      );
    }
  }
}
