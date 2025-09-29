// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_chain_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EvolutionChainDataAdapter extends TypeAdapter<EvolutionChainData> {
  @override
  final int typeId = 3;

  @override
  EvolutionChainData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EvolutionChainData(
      id: fields[0] as int,
      evolutions: (fields[1] as List).cast<EvolutionData>(),
    );
  }

  @override
  void write(BinaryWriter writer, EvolutionChainData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.evolutions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EvolutionChainDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
