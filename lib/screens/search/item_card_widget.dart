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
    return Expanded(
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.error),
              trailing: const ExpansionTile(
                title: Text('MORE..'),
                children: [
                  Text('1..'),
                  Text('1..'),
                  Text('1..'),
                  Text('1..'),
                  Text('1..'),
                ],
              ),
              visualDensity: const VisualDensity(vertical: -4),
              subtitle: Text(mitTitle ?? ''),
              dense: true,
            ),
            ListTile(
              visualDensity: const VisualDensity(vertical: -4),
              subtitle: Text(mitNotation ?? ''),
              dense: true,
            ),
            ListTile(
              visualDensity: const VisualDensity(vertical: -4),
              subtitle: Text(miNumber ?? ''),
              dense: true,
            ),
          ],
        ),
      ),
    );
  }
}
