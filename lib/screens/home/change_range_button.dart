// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class ChangeRangeButton extends StatelessWidget {
  final DateRangePickerController _datePickerController =
      DateRangePickerController();

  ChangeRangeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet<dynamic>(
          isScrollControlled: true,
          isDismissible: false,
          elevation: 5,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          context: context,
          builder: (context) => SafeArea(
            minimum: const EdgeInsets.only(top: 50),
            child: SfDateRangePicker(
              allowViewNavigation: false,
              view: DateRangePickerView.decade,
              selectionMode: DateRangePickerSelectionMode.range,
              showActionButtons: true,
              cancelText: 'ОТМЕНА',
              controller: _datePickerController,
              onSubmit: (value) {
                Navigator.pop(context);
              },
              onCancel: () {
                _datePickerController.selectedRange = null;

                Navigator.pop(context);
              },
              onSelectionChanged: _onSelectionChanged,
            ),
          ),
        );
      },
      child: const Text('Изменить диапазон поиска'),
    );
  }

  void _onSelectionChanged(
    DateRangePickerSelectionChangedArgs args,
  ) {
    final argsStartDate = args.value.startDate as DateTime;
    DateTime argsEndDate;

    args.value.endDate != null
        ? argsEndDate = args.value.endDate as DateTime
        : argsEndDate = args.value.startDate as DateTime;

    final startYear = DateFormat('yyyy').format(argsStartDate);

    final endYear = DateFormat('yyyy').format(argsEndDate);

    // ignore: avoid_print
    print('$startYear --------- $endYear');
  }
}
