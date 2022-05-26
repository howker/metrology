import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AccurateOnOffSwitcher extends StatelessWidget {
  const AccurateOnOffSwitcher({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      builder: (context, box, _) {
        final isAccurateSearchMode =
            box.get('accurateBox', defaultValue: true) as bool;
        return SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(seconds: 5),
                child: Switch(
                  value: isAccurateSearchMode,
                  onChanged: (value) {
                    box.put(
                      'accurateBox',
                      value,
                    );
                  },
                ),
              ),
              Text(
                'точный поиск по номеру',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        );
      },
      valueListenable: Hive.box<bool>('accurateBox').listenable(),
    );
  }
}
