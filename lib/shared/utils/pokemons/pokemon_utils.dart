import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:pokedex/core/dependency_injection/injectable.dart';
import 'package:pokedex/core/theme/app_colors.dart';
import 'package:pokedex/features/home/domain/models/pokemon_type.dart';
import 'package:pokedex/gen/assets.gen.dart';
import 'package:pokedex/shared/utils/helper/path_helper.dart';
import 'package:pokedex/shared/utils/pokemons/pokemon_utils_store.dart';

class PokemonTypeUtils {
  static final _typeStore = getIt<PokemonTypeStore>();

  /// Carrega os tipos
  static Future<void> init() async {
    await _typeStore.loadTypes();
  }

  /// Busca o tipo (label e cor) correspondente a uma string do tipo
  static PokemonType? getType(String? type) {
    if (_typeStore.types.isEmpty) return null;

    return _typeStore.types.firstWhereOrNull(
      (t) => t.type.toLowerCase() == type?.toLowerCase(),
    );
  }

  /// Retorna uma cor para o tipo, ou cor padrão
  static Color getColor(String? type) {
    return getType(type)?.color ?? AppColors.transparent;
  }

  /// Retorna o label traduzido (ou original, se não encontrar)
  static String? getLabel(String? type) {
    return getType(type ?? '')?.label ?? type;
  }

  /// Retorna o caminho da imagem para o tipo.
  static String getTypeImage(String? type) {
    final partialPath = AssetUtils.getPartialPath(
      Assets.icons.pokemonTypes.bug.path,
    );
    return '$partialPath/${type?.toLowerCase() ?? ''}.png';
  }
}
