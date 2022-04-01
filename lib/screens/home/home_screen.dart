import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infopoverka/key_packages.dart';
import 'package:infopoverka/screens/home/search_elevated_button.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textEditingController = TextEditingController();
    var searchRequest = '';
    var startDate = '2018';

    final dateFormat = DateFormat('yyyy');

    var finishDate = dateFormat.format(DateTime.now());

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Искать с'),
                TextButton(
                  onPressed: () {
                    showModalBottomSheet<dynamic>(
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      context: context,
                      builder: (context) => Center(
                        child: CupertinoDatePicker(
                          initialDateTime: DateTime(2018),
                          maximumYear: 2099,
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: (value) {},
                        ),
                      ),
                    );
                  },
                  child: Text(startDate),
                ),
                const Text('по'),
                TextButton(
                  onPressed: () {},
                  child: Text(finishDate),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SearchElevatedButton(searchRequest: searchRequest),
          ],
        ),
      ),
    );
  }
}
