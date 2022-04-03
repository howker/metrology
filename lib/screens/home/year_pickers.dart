import 'package:flutter/cupertino.dart';
import 'package:infopoverka/providers/data_range_provider.dart';
import 'package:provider/provider.dart';

class YearPickers extends StatelessWidget {
  const YearPickers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final yearsList = List<Widget>.generate(
      20,
      (index) => Text(
        (int.parse(context.watch<DataRangeProvider>().startDate) + index)
            .toString(),
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
                context.read<DataRangeProvider>().setStartDate('2000');
              },
              children: yearsList,
            ),
          ),
          Expanded(
            child: CupertinoPicker(
              looping: true,
              useMagnifier: true,
              magnification: 1.5,
              itemExtent: 25,
              onSelectedItemChanged: (value) {
                context.read<DataRangeProvider>().setFinishDate('2030');
              },
              children: yearsList,
            ),
          ),
        ],
      ),
    );
  }
}
