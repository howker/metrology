import 'package:flutter/material.dart';
import 'package:infopoverka/screens/date_range/date_range_screen.dart';
import 'package:infopoverka/screens/home/ok_button.dart';
import 'package:infopoverka/screens/home/year_pickers.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ChangeRangeButton extends StatelessWidget {
  const ChangeRangeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dateRange = DateTimeRange(start: DateTime(2018), end: DateTime(2022));
    return ElevatedButton(
      onPressed: () {
        final Route route = MaterialPageRoute<dynamic>(
          builder: (context) => const DateRangeScreen(),
        );
        Navigator.push<void>(context, route);

        // showModalBottomSheet<dynamic>(
        //   isDismissible: false,
        //   elevation: 5,
        //   shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        //   ),
        //   context: context,
        //   builder: (context) => Column(
        //     children: [
        //       const OkButton(),
        //     ],
        //   ),

        // Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text('Выбор диапазона поиска'),
        //       //YearPickers(),
        //     ],
        //   ),
        // ),
        //);
      },
      child: const Text('Изменить диапазон поиска'),
    );
  }
}
