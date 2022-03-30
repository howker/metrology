import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final bool applicability;
  final String? vriId;
  final String? orgTitle;
  final String? mitNumber;
  final String? mitTitle;
  final String? mitNotation;
  final String? miModification;
  final String? miNumber;
  final String? verificationDate;
  final String? validDate;
  final String? resultDocnum;

  const ItemCard({
    required this.applicability,
    Key? key,
    this.vriId,
    this.orgTitle,
    this.mitNumber,
    this.mitTitle,
    this.mitNotation,
    this.miModification,
    this.miNumber,
    this.verificationDate,
    this.validDate,
    this.resultDocnum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Text('Организация - поверитель'),
            title: Text(orgTitle ?? ''),
          ),
          ListTile(
            leading: const Text('Рег № типа СИ'),
            title: Text(mitNumber ?? ''),
          ),
          ListTile(
            leading: const Text('Наименование типа СИ'),
            title: Text(mitTitle ?? ''),
          ),
          ListTile(
            leading: const Text('Обозначение типа СИ'),
            title: Text(mitNotation ?? ''),
          ),
          ListTile(
            leading: const Text('Модификация СИ'),
            title: Text(miModification ?? ''),
          ),
          ListTile(
            leading: const Text('Заводской/серийный номер'),
            title: Text(miNumber ?? ''),
          ),
          ListTile(
            leading: const Text('Дата поверки'),
            title: Text(verificationDate ?? ''),
          ),
          ListTile(
            leading: const Text('Действительна до'),
            title: Text(validDate ?? ''),
          ),
          ListTile(
            leading: const Text('Номер свидетельства'),
            title: Text(resultDocnum ?? ''),
          ),
          ListTile(
            leading: const Text('Номер свидетельства'),
            title: applicability
                ? const Text('Пригодно')
                : const Text(
                    'Непригодно',
                    style: TextStyle(color: Colors.red),
                  ),
          ),
        ],
      ),
    );
  }
}
