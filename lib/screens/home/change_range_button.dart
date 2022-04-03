import 'package:flutter/material.dart';
import 'package:infopoverka/screens/home/cancel_button.dart';
import 'package:infopoverka/screens/home/ok_button.dart';
import 'package:infopoverka/screens/home/year_pickers.dart';

class ChangeRangeButton extends StatelessWidget {
  const ChangeRangeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet<dynamic>(
          isDismissible: false,
          elevation: 5,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          context: context,
          builder: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CancelButton(),
                      OkButton(),
                    ],
                  ),
                ),
                const Text('Выбор диапазона поиска'),
                const YearPickers(),
              ],
            ),
          ),
        );
      },
      child: const Text('Изменить диапазон поиска'),
    );
  }
}
