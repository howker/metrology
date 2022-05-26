import 'package:flutter/material.dart';
import 'package:infopoverka/providers/select_provider.dart';
import 'package:infopoverka/screens/filter/filter_screen.dart';
import 'package:provider/provider.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.green,
      child: const Icon(Icons.filter_list_alt),
      onPressed: () {
        context.read<SelectProvider>().clearSelectedList();
        final Route route = MaterialPageRoute<dynamic>(
          builder: (context) => const FilterScreen(),
        );
        Navigator.push<dynamic>(context, route);
      },
    );
  }
}
