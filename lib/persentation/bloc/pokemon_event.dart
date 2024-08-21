part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPokemons extends PokemonEvent {
  final int first;

  FetchPokemons(this.first);

  @override
  List<Object> get props => [first];
}

class FilterPokemonsByType extends PokemonEvent {
  final String type;

  FilterPokemonsByType(this.type);
}

class ResetFilter extends PokemonEvent {}