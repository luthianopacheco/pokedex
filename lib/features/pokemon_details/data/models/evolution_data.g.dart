// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EvolutionDataAdapter extends TypeAdapter<EvolutionData> {
  @override
  final int typeId = 4;

  @override
  EvolutionData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EvolutionData(
      id: fields[0] as int,
      name: fields[1] as String,
      minLevel: fields[2] as int?,
      url: fields[3] as String?,
      imageUrl: fields[4] as String?,
      types: (fields[5] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, EvolutionData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.minLevel)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.imageUrl)
      ..writeByte(5)
      ..write(obj.types);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EvolutionDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
