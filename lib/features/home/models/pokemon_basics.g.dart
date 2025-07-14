// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_basics.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonBasicsAdapter extends TypeAdapter<PokemonBasics> {
  @override
  final int typeId = 0;

  @override
  PokemonBasics read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonBasics(
      id: fields[0] as int,
      name: fields[1] as String,
      url: fields[2] as String,
      imageUrl: fields[3] as String?,
      types: (fields[4] as List?)?.cast<String>(),
      isFetched: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PokemonBasics obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.types)
      ..writeByte(5)
      ..write(obj.isFetched);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonBasicsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
