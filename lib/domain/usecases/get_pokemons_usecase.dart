import 'package:pokedex_graphql/data/repository/pokemon_repository.dart';
import 'package:pokedex_graphql/domain/entities/pokemon_entity.dart';

class GetPokemonsUseCase {
  final PokemonRepository repository;

  GetPokemonsUseCase(this.repository);

  Future<List<PokemonEntity>> execute(int first) async {
    final pokemons = await repository.fetchPokemons(first);
    return pokemons.map((model) => PokemonEntity.fromJson(model.toJson())).toList();
  }
}
