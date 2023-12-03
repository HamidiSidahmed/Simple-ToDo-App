// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekboxclass.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class weekboxclassAdapter extends TypeAdapter<weekboxclass> {
  @override
  final int typeId = 2;

  @override
  weekboxclass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return weekboxclass(
      fields[0] as String,
      fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, weekboxclass obj) {
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
      other is weekboxclassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
