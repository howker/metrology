import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinishDataButton extends StatelessWidget {
  final String finishDate;

  const FinishDataButton({
    required this.finishDate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final yearsList = List<Widget>.generate(
      20,
      (index) => Text((int.parse('2019') + index).toString()),
    );
    return TextButton(
      onPressed: () {
        showModalBottomSheet<dynamic>(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          context: context,
          builder: (context) => Center(
            child: CupertinoPicker(
              looping: true,
              useMagnifier: true,
              magnification: 1.5,
              itemExtent: 25,
              onSelectedItemChanged: (value) {
                // ignore: avoid_print
                print(yearsList[value]);
              },
              children: yearsList,
            ),
          ),
        );
      },
      child: Text(finishDate),
    );
  }
}
