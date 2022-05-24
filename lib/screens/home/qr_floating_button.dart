import 'package:flutter/material.dart';
import 'package:infopoverka/providers/buttons_provider.dart';
import 'package:infopoverka/screens/home/qr_scanner.dart';
import 'package:provider/provider.dart';

class QrFloatingButton extends StatefulWidget {
  const QrFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  State<QrFloatingButton> createState() => _QrFloatingButtonState();
}

class _QrFloatingButtonState extends State<QrFloatingButton> {
  Color _newColor = Colors.yellow;
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: context.watch<ButtonsProvider>().isQrButtonActive,
      child: TweenAnimationBuilder<Color?>(
        tween: ColorTween(begin: Colors.lightGreen, end: _newColor),
        duration: const Duration(seconds: 2),
        builder: (_, color, __) {
          return ColorFiltered(
            colorFilter: ColorFilter.mode(color!, BlendMode.modulate),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FloatingActionButton(
                elevation: 10,
                shape: CircleBorder(
                  side: BorderSide(color: color, width: 3.0),
                ),
                backgroundColor:
                    !context.watch<ButtonsProvider>().isQrButtonActive
                        ? Color.fromARGB(255, 9, 146, 14)
                        : Colors.grey,
                child: const Icon(Icons.qr_code),
                onPressed: () {
                  context.read<ButtonsProvider>().qrButtonClicked();
                  final Route route = MaterialPageRoute<dynamic>(
                    builder: (context) => const QrScanner(),
                  );
                  Navigator.push<void>(context, route);
                },
              ),
            ),
          );
        },
        onEnd: () {
          setState(() {
            _newColor = _newColor == Colors.lightGreen
                ? Colors.yellow
                : Colors.lightGreen;
          });
        },
        // child: ColorFiltered(
        //   colorFilter: ColorFilter.mode(Colors.blue, BlendMode.modulate),
        // ),
      ),
    );
  }
}
