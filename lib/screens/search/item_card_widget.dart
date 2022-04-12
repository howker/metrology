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
    return Container();
  }
}
