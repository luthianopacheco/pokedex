// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gender_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GenderDataAdapter extends TypeAdapter<GenderData> {
  @override
  final int typeId = 2;

  @override
  GenderData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GenderData(
      male: fields[0] as double,
      female: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, GenderData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.male)
      ..writeByte(1)
      ..write(obj.female);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenderDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
