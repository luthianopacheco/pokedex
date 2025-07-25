import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:pokedex/features/home/models/pokemon_type.dart';

class PokemonTypeUtils {
  static List<PokemonType> _types = [];

  static void setTypes(List<PokemonType> types) {
    _types = types.toSet().toList();
  }

  /// Busca o tipo (label e cor) correspondente a uma string do tipo
  static PokemonType? getType(String? type) {
    return _types.firstWhereOrNull(
      (t) => t.type.toLowerCase() == type?.toLowerCase(),
    );
  }

  /// Retorna uma cor para o tipo, ou cor padrão
  static Color getColor(String? type) {
    return getType(type)?.color ?? const Color(0xFFAAAAAA);
  }

  /// Retorna o label traduzido (ou original, se não encontrar)
  static String? getLabel(String? type) {
    return getType(type ?? '')?.label ?? type;
  }

  /// Retorna o caminho da imagem para o tipo.
  static String getTypeImage(String? type) {
    return 'assets/icons/pokemon_types/${type?.toLowerCase() ?? ''}.png';
  }
}
