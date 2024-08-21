import 'package:pokedex_graphql/data/repository/pokemon_repository.dart';
import 'package:pokedex_graphql/domain/entities/pokemon_entity.dart';

class GetPokemonUseCase {
  final PokemonRepository repository;

  GetPokemonUseCase(this.repository);

  Future<PokemonEntity> execute(String id) async {
    final pokemons = await repository.fetchPokemon(id);
    return PokemonEntity.fromJson(pokemons.toJson());
  }
}
