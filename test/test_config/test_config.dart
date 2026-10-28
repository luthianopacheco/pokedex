import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/core/services/evolutions_cache_service.dart';
import 'package:pokedex/core/services/pokemon_cache_service.dart';
import 'package:pokedex/core/stores/app_error_store.dart';
import 'package:pokedex/features/pokemon_details/domain/models/evolution_chain.dart';
import 'package:pokedex/features/pokemon_details/domain/models/pokemon_with_evolutions.dart';
import 'package:pokedex/features/pokemon_details/domain/repositories/i_pokemon_details_repository.dart';
import 'package:pokedex/features/pokemon_details/domain/use_cases/get_pokemon_details_usecase.dart';
import 'package:pokedex/shared/data/models/pokemon_data.dart';

class MockAppErrorStore extends Mock implements AppErrorStore {}

class MockGetPokemonDetailsUseCase extends Mock
    implements GetPokemonDetailsUseCase {}

class MockPokemonDetailsRepository extends Mock
    implements IPokemonDetailsRepository {}

class MockPokemonCacheService extends Mock implements PokemonCacheService {}

class MockEvolutionChainCacheService extends Mock
    implements EvolutionChainCacheService {}

class MockDio extends Mock implements Dio {}

class FakePokemonData extends Fake implements PokemonData {}

class FakeEvolutionChain extends Fake implements EvolutionChain {}

const tPokemonId = 4;
final tPokemonData = PokemonData(
  id: tPokemonId,
  name: 'charmander',
  url: '',
  isBasicFetched: true,
);
final tPokemonDataFetched = tPokemonData.copyWithDetails(
  speciesJson: {
    'flavor_text_entries': [],
    'evolution_chain': {'url': 'https://pokeapi.co/api/v2/evolution-chain/1/'},
  },
  typeJson: {
    'damage_relations': {'double_damage_from': []},
  },
);
final tEvolutionChain = EvolutionChain(id: 1, evolutions: []);
final tPokemonWithEvolutions = PokemonWithEvolutions(
  pokemon: tPokemonDataFetched,
  evolutionChain: tEvolutionChain,
);

void registerFallbacks() {
  registerFallbackValue(FakePokemonData());
  registerFallbackValue(FakeEvolutionChain());
  registerFallbackValue(EvolutionChain(id: 0, evolutions: []));
  registerFallbackValue(tPokemonWithEvolutions);
}
