import 'package:flutter/material.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class LoadingYearIndicator extends StatelessWidget {
  const LoadingYearIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentSearchingYear =
        context.watch<ItemListProvider>().currentSearchingYear;
    return Shimmer.fromColors(
      baseColor: Colors.green,
      highlightColor: Colors.white,
      child: Text(
        'Поиск',
        //currentSearchingYear, //TODO вернуть строку как исправят бэк
        style: const TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
