import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.share),
      onPressed: () {
        // final Route route = MaterialPageRoute<dynamic>(
        //   builder: (context) => const FilterScreen(),
        // );
        // Navigator.push<dynamic>(context, route);
      },
    );
  }
}
