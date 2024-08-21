part of 'pokemon_detail_bloc.dart';

abstract class PokemonDetailEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPokemon extends PokemonDetailEvent {
  final String id;

  FetchPokemon(this.id);

  @override
  List<Object> get props => [id];
}
