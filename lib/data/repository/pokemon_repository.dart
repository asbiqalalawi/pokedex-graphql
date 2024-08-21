import 'package:pokedex_graphql/data/datasource/pokemon_remote_datasource.dart';
import 'package:pokedex_graphql/data/models/pokemon_model.dart';

class PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  PokemonRepository(this.remoteDataSource);

  Future<List<PokemonModel>> fetchPokemons(int first) async {
    return await remoteDataSource.fetchPokemons(first);
  }

  Future<PokemonModel> fetchPokemon(String id) async {
    return await remoteDataSource.fetchPokemon(id);
  }
}
