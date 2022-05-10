// ignore_for_file: cascade_invocations

import 'package:hive/hive.dart';
import 'package:infopoverka/models/item.dart';

class ItemsHiveAdapter extends TypeAdapter<Items> {
  @override
  final int typeId = 0;

  @override
  Items read(BinaryReader reader) {
    final vriId = reader.readString();
    final orgTitle = reader.readString();
    final mitNumber = reader.readString();
    final mitTitle = reader.readString();
    final mitNotation = reader.readString();
    final miModification = reader.readString();
    final miNumber = reader.readString();
    final verificationDate = reader.readString();
    final validDate = reader.readString();
    final resultDocnum = reader.readString();
    final applicability = reader.readBool();
    final isSelected = reader.readBool();
    final isFavorite = reader.readBool();
    return Items(
      applicability: applicability,
      miModification: miModification,
      miNumber: miNumber,
      mitNotation: mitNotation,
      mitNumber: mitNumber,
      mitTitle: mitTitle,
      orgTitle: orgTitle,
      resultDocnum: resultDocnum,
      validDate: validDate,
      verificationDate: verificationDate,
      vriId: vriId,
      isFavorite: isFavorite,
      isSelected: isSelected,
    );
  }

  @override
  void write(BinaryWriter writer, Items obj) {
    writer.writeString(obj.vriId!);
    writer.writeString(obj.orgTitle!);
    writer.writeString(obj.mitNumber!);
    writer.writeString(obj.mitTitle!);
    writer.writeString(obj.mitNotation!);
    writer.writeString(obj.miModification!);
    writer.writeString(obj.miNumber!);
    writer.writeString(obj.verificationDate!);
    writer.writeString(obj.validDate!);
    writer.writeString(obj.resultDocnum!);
    writer.writeBool(obj.applicability!);
    writer.writeBool(obj.isSelected);
    writer.writeBool(obj.isFavorite);
  }
}
