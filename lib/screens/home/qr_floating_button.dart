import 'package:flutter/material.dart';
import 'package:infopoverka/providers/buttons_provider.dart';
import 'package:infopoverka/screens/home/qr_scanner.dart';
import 'package:provider/provider.dart';

class QrFloatingButton extends StatelessWidget {
  const QrFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: context.watch<ButtonsProvider>().isQrButtonActive,
      child: FloatingActionButton(
        backgroundColor: !context.watch<ButtonsProvider>().isQrButtonActive
            ? Colors.blue
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
    );
  }
}
