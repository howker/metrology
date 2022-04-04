import 'package:flutter/material.dart';
import 'package:infopoverka/providers/data_range_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
                final startYear = DateFormat('yyyy').format(
                  _datePickerController.selectedRange?.startDate as DateTime,
                );

                String endYear;

                _datePickerController.selectedRange?.endDate != null
                    ? endYear = DateFormat('yyyy').format(_datePickerController
                        .selectedRange?.endDate as DateTime)
                    : endYear = DateFormat('yyyy').format(_datePickerController
                        .selectedRange?.startDate as DateTime);

                context.read<DataRangeProvider>().setStartDate(startYear);
                context.read<DataRangeProvider>().setFinishDate(endYear);

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

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {}
}
