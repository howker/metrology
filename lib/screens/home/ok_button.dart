import 'package:flutter/material.dart';

class OkButton extends StatelessWidget {
  const OkButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('OK'),
    );
  }
}
