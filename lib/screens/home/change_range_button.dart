import 'package:flutter/material.dart';
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
              children: const [
                Text('Выбор диапазона поиска'),
                YearPickers(),
                OkButton(),
              ],
            ),
          ),
        );
      },
      child: const Text('Изменить диапазон поиска'),
    );
  }
}
