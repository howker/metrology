import 'package:flutter/cupertino.dart';
import 'package:infopoverka/providers/data_range_provider.dart';
import 'package:provider/provider.dart';

class YearPickers extends StatelessWidget {
  const YearPickers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final yearsNumbersStart = List<int>.generate(20, (index) => index + 2018);
    final yearsNumbersFinish = List<int>.generate(20, (index) => index + 2022);

    final yearsListStart = List<Widget>.generate(
      20,
      (index) => Text(
        (int.parse('2018') + index).toString(),
      ),
    );

    final yearsListFinish = List<Widget>.generate(
      20,
      (index) => Text(
        (int.parse('2022') + index).toString(),
      ),
    );

    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Row(
        children: [
          Expanded(
            child: CupertinoPicker(
              looping: true,
              useMagnifier: true,
              magnification: 1.5,
              itemExtent: 25,
              onSelectedItemChanged: (value) {
                context
                    .read<DataRangeProvider>()
                    .setStartDate('${yearsNumbersStart[value]}');
              },
              children: yearsListStart,
            ),
          ),
          Expanded(
            child: CupertinoPicker(
              looping: true,
              useMagnifier: true,
              magnification: 1.5,
              itemExtent: 25,
              onSelectedItemChanged: (value) {
                context
                    .read<DataRangeProvider>()
                    .setFinishDate('${yearsNumbersFinish[value]}');
              },
              children: yearsListFinish,
            ),
          ),
        ],
      ),
    );
  }
}
