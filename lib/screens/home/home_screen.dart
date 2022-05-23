import 'package:flutter/material.dart';
import 'package:infopoverka/key_packages.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
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
            const AccurateOnOffSwitcher(),
            SizedBox(
              height: 55,
              width: double.infinity,
              child: TextFormField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.blue),
                  label: Text(
                    'Введите номер СИ',
                    style: TextStyle(color: Colors.blue),
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
            Text(
              'Искать с ${context.watch<DataRangeProvider>().startDateValue} по ${context.watch<DataRangeProvider>().finishDateValue} год',
            ),
            ChangeRangeButton(),
            const SearchElevatedButton(),
          ],
        ),
      ),
    );
  }
}
