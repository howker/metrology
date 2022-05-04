import 'package:flutter/material.dart';
import 'package:infopoverka/screens/home/qr_scanner.dart';

class QrFloatingButton extends StatelessWidget {
  const QrFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.qr_code),
      onPressed: () {
        final Route route = MaterialPageRoute<dynamic>(
          builder: (context) => const QrScanner(),
        );
        Navigator.push<void>(context, route);
      },
    );
  }
}
