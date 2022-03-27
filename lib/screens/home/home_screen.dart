import 'package:flutter/material.dart';
import 'package:infopoverka/domain/api_clients/api_client.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiClient().getItems(search: '01110425');
    return Container();
  }
}
