import 'package:flutter/material.dart';
import 'package:infopoverka/screens/home/ok_button.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateRangeScreen extends StatelessWidget {
  const DateRangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SfDateRangePicker(
              allowViewNavigation: false,
              view: DateRangePickerView.decade,
              selectionMode: DateRangePickerSelectionMode.range,
              showActionButtons: true,
              cancelText: 'ОТМЕНА',
              onSubmit: (value) {
                Navigator.pop(context);
              },
              onCancel: () {
                Navigator.pop(context);
              },
            ),
            const OkButton(),
          ],
        ),
      ),
    );
  }
}
