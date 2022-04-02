import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartDataButton extends StatelessWidget {
  final String startDate;

  const StartDataButton({
    required this.startDate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final yearsList = List<Widget>.generate(
      20,
      (index) => Text((int.parse(startDate) + index).toString()),
    );
    return TextButton(
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
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Отмена'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
                const Text('Выбор диапазона поиска'),
                SizedBox(
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
                          onSelectedItemChanged: (value) {},
                          children: yearsList,
                        ),
                      ),
                      Expanded(
                        child: CupertinoPicker(
                          looping: true,
                          useMagnifier: true,
                          magnification: 1.5,
                          itemExtent: 25,
                          onSelectedItemChanged: (value) {},
                          children: yearsList,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Text(startDate),
    );
  }
}
