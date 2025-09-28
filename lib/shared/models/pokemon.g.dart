// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonAdapter extends TypeAdapter<Pokemon> {
  @override
  final int typeId = 0;

  @override
  Pokemon read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pokemon(
      id: fields[0] as int,
      name: fields[1] as String,
      url: fields[2] as String,
      imageUrl: fields[3] as String?,
      types: (fields[4] as List?)?.cast<String>(),
      isBasicFetched: fields[5] as bool,
      animatedImageUrl: fields[6] as String?,
      description: fields[7] as String?,
      weight: fields[8] as double?,
      height: fields[9] as double?,
      category: fields[10] as String?,
      abilities: (fields[11] as List?)?.cast<String>(),
      gender: fields[12] as Gender?,
      weaknesses: (fields[13] as List?)?.cast<String>(),
      chainId: fields[14] as int?,
      isDetailsFetched: fields[15] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Pokemon obj) {
    writer
      ..writeByte(16)
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
      ..write(obj.isBasicFetched)
      ..writeByte(6)
      ..write(obj.animatedImageUrl)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.weight)
      ..writeByte(9)
      ..write(obj.height)
      ..writeByte(10)
      ..write(obj.category)
      ..writeByte(11)
      ..write(obj.abilities)
      ..writeByte(12)
      ..write(obj.gender)
      ..writeByte(13)
      ..write(obj.weaknesses)
      ..writeByte(14)
      ..write(obj.chainId)
      ..writeByte(15)
      ..write(obj.isDetailsFetched);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
