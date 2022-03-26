import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  final String vriId;
  final String orgTitle;
  final String mitNumber;
  final String mitTitle;
  final String mitNotation;

  final String miModification;
  final String miNumber;
  final String verificationDate;
  final String validDate;
  final String resultDocnum;
  final bool applicability;

  Item({
    required this.vriId,
    required this.orgTitle,
    required this.mitNumber,
    required this.mitTitle,
    required this.mitNotation,
    required this.miModification,
    required this.miNumber,
    required this.verificationDate,
    required this.validDate,
    required this.resultDocnum,
    required this.applicability,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
