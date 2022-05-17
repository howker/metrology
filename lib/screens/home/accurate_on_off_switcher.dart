import 'package:flutter/material.dart';

class AccurateOnOffSwitcher extends StatelessWidget {
  const AccurateOnOffSwitcher({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(seconds: 5),
            child: Switch(value: true, onChanged: (value) {}),
          ),
          const Text('точный поиск'),
        ],
      ),
    );
  }
}
