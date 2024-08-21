import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokedex_graphql/data/models/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<List<PokemonModel>> fetchPokemons(int first);
  Future<PokemonModel> fetchPokemon(String id);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final GraphQLClient client;

  PokemonRemoteDataSourceImpl(this.client);

  @override
  Future<List<PokemonModel>> fetchPokemons(int first) async {
    const String query = '''
    query GetPokemons(\$first: Int!) {
      pokemons(first: \$first) {
        id
        number
        name
        image
        types
        weight {
          minimum
          maximum
        }
        height {
          minimum
          maximum
        }
        resistant
        weaknesses
      }
    }
    ''';

    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: {'first': first},
    );

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      throw Exception('Failed to load Pokemons');
    }

    final List<dynamic> data = result.data?['pokemons'];

    return data.map((pokemon) => PokemonModel.fromJson(pokemon)).toList();
  }

  @override
  Future<PokemonModel> fetchPokemon(String id) async {
    const String query = '''
    query GetPokemon(\$id: String) {
      pokemon(id: \$id) {
        id
        name
        number
        types
        image
        weight {
          minimum
          maximum
        }
        height {
          minimum
          maximum
        }
        resistant
        weaknesses
      }
    }
    ''';

    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: {'id': id},
    );

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      throw Exception('Failed to load Pokemons');
    }

    final dynamic data = result.data?['pokemon'];

    return PokemonModel.fromJson(data);
  }
}
