import 'package:flutter/material.dart';
import 'package:infopoverka/key_packages.dart';
import 'package:infopoverka/providers/data_range_provider.dart';
import 'package:infopoverka/screens/home/change_range_button.dart';
import 'package:infopoverka/screens/home/search_elevated_button.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
                onChanged: (text) {
                  searchRequest = text;
                },
              ),
            ),
            Text(
              'Искать с ${context.watch<DataRangeProvider>().startDate} по ${context.watch<DataRangeProvider>().finishDate} год',
            ),
            ChangeRangeButton(),
            SearchElevatedButton(searchRequest: searchRequest),
          ],
        ),
      ),
    );
  }
}
