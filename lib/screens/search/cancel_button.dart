import 'package:flutter/material.dart';
import 'package:infopoverka/data_sources/reestr_items_remote_data_source.dart';
import 'package:infopoverka/locator_service.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        sl
            .get<ReestrItemsRemoteDataSource>()
            .apiClient
            .token
            .cancel('Запрос отменён');
      },
      child: const Text('Прервать поиск'),
    );
  }
}
