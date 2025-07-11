import 'package:flutter/material.dart';
import 'package:pokedex/features/home/models/selector_item.dart';

class PokemonType implements SelectorItem {
  @override
  final String type;
  @override
  final String label;
  @override
  final Color color;

  PokemonType({required this.type, required this.label, required this.color});
}

final pokemonTypeList = [
  PokemonType(type: 'all', label: 'Todos os tipos', color: Color(0xff333333)),
  PokemonType(type: 'water', label: 'Água', color: Color(0xff5090D6)),
  PokemonType(type: 'dragon', label: 'Dragão', color: Color(0xff0B6DC3)),
  PokemonType(type: 'electric', label: 'Elétrico', color: Color(0xffF4D23C)),
  PokemonType(type: 'fairy', label: 'Fada', color: Color(0xffEC8FE6)),
  PokemonType(type: 'ghost', label: 'Fantasma', color: Color(0xff5269AD)),
  PokemonType(type: 'fire', label: 'Fogo', color: Color(0xffFF9D55)),
  PokemonType(type: 'ice', label: 'Gelo', color: Color(0xff73CEC0)),
  PokemonType(type: 'grass', label: 'Grama', color: Color(0xff63BC5A)),
  PokemonType(type: 'bug', label: 'Inseto', color: Color(0xff91C12F)),
  PokemonType(type: 'fighting', label: 'Lutador', color: Color(0xffCE416B)),
  PokemonType(type: 'normal', label: 'Normal', color: Color(0xff919AA2)),
  PokemonType(type: 'dark', label: 'Noturno', color: Color(0xff5A5465)),
  PokemonType(type: 'steel', label: 'Metal', color: Color(0xff5A8EA2)),
  PokemonType(type: 'rock', label: 'Pedra', color: Color(0xffC5B78C)),
  PokemonType(type: 'psychic', label: 'Psíquico', color: Color(0xffFA7179)),
  PokemonType(type: 'ground', label: 'Terrestre', color: Color(0xffD97845)),
  PokemonType(type: 'poison', label: 'Venenoso', color: Color(0xffB567CE)),
  PokemonType(type: 'flying', label: 'Voador', color: Color(0xff89AAE3)),
];
