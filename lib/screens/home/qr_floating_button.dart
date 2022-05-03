import 'package:flutter/material.dart';

class QrFloatingButton extends StatelessWidget {
  const QrFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.qr_code),
      onPressed: () {},
    );
  }
}
