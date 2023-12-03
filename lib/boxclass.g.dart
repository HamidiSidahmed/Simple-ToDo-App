// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boxclass.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class boxclassAdapter extends TypeAdapter<boxclass> {
  @override
  final int typeId = 1;

  @override
  boxclass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return boxclass(
      fields[0] as String,
      fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, boxclass obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.doing)
      ..writeByte(1)
      ..write(obj.state);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is boxclassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
