import 'package:flutter/material.dart';
import 'package:infopoverka/key_packages.dart';

class SearchScreen extends StatelessWidget {
  final String searchRequest;

  const SearchScreen({
    required this.searchRequest,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Найдены результаты поверки СИ',
          style: AppTextStyles.kSFBody14,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(searchRequest),
            ],
          );
        },
      ),
    );
  }
}
