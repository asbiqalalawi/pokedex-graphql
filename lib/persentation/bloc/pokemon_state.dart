part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {
  final List<PokemonEntity> oldPokemons;
  final bool isFirstFetch;

  PokemonLoading(this.oldPokemons, {this.isFirstFetch = false});
}

class PokemonLoaded extends PokemonState {
  final List<PokemonEntity> pokemons;
  final String? filterType;

  PokemonLoaded(this.pokemons, {this.filterType});

  @override
  List<Object> get props => [pokemons];
}

class PokemonError extends PokemonState {
  final String message;

  PokemonError(this.message);

  @override
  List<Object> get props => [message];
}
