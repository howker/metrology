import 'package:flutter/material.dart';
import 'package:infopoverka/providers/data_range_provider.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:infopoverka/screens/home/accurate_on_off_switcher.dart';
import 'package:infopoverka/screens/home/change_range_button.dart';
import 'package:infopoverka/screens/home/qr_floating_button.dart';
import 'package:infopoverka/screens/home/search_elevated_button.dart';
import 'package:infopoverka/screens/settings/settings_screen.dart';
import 'package:infopoverka/utils/input_utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textEditingController = TextEditingController();
    var searchRequest = '';
    InputUtils.hideKeyboard();

    return Scaffold(
      drawer: const Drawer(
        child: SettingsScreen(),
      ),
      floatingActionButton: const QrFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text(
          'Поиск сведений о результатах\nповерки СИ',
          style: Theme.of(context).textTheme.bodyText2,
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              const AccurateOnOffSwitcher(),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: TextFormField(
                  style: Theme.of(context).textTheme.headline1,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.arrow_forward,
                    ),
                    label: Text(
                      'Введите номер СИ',
                      style: Theme.of(context).textTheme.overline,
                      //textAlign: TextAlign.center
                    ),
                  ),
                  controller: textEditingController,
                  onFieldSubmitted: (text) {
                    InputUtils.hideKeyboard();
                    searchRequest = text;
                    context
                        .read<ItemListProvider>()
                        .setSearchRequest(searchRequest);
                  },
                  onEditingComplete: () {
                    InputUtils.hideKeyboard();
                    searchRequest = textEditingController.text;
                    context
                        .read<ItemListProvider>()
                        .setSearchRequest(searchRequest);
                  },
                  onChanged: (text) {
                    searchRequest = text;
                    context
                        .read<ItemListProvider>()
                        .setSearchRequest(searchRequest);
                  },
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Искать с ${context.watch<DataRangeProvider>().startDateValue} по ${context.watch<DataRangeProvider>().finishDateValue} год',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              ChangeRangeButton(),
              const SearchElevatedButton(),
            ],
          ),
        ),
      ),
    );
  }
}
