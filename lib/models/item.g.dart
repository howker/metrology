// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      vriId: json['vriId'] as String,
      orgTitle: json['orgTitle'] as String,
      mitNumber: json['mitNumber'] as String,
      mitTitle: json['mitTitle'] as String,
      mitNotation: json['mitNotation'] as String,
      miModification: json['miModification'] as String,
      miNumber: json['miNumber'] as String,
      verificationDate: json['verificationDate'] as String,
      validDate: json['validDate'] as String,
      resultDocnum: json['resultDocnum'] as String,
      applicability: json['applicability'] as bool,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'vriId': instance.vriId,
      'orgTitle': instance.orgTitle,
      'mitNumber': instance.mitNumber,
      'mitTitle': instance.mitTitle,
      'mitNotation': instance.mitNotation,
      'miModification': instance.miModification,
      'miNumber': instance.miNumber,
      'verificationDate': instance.verificationDate,
      'validDate': instance.validDate,
      'resultDocnum': instance.resultDocnum,
      'applicability': instance.applicability,
    };
