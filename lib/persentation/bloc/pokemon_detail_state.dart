part of 'pokemon_detail_bloc.dart';

abstract class PokemonDetailState extends Equatable {
  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonDetailState {}

class PokemonLoading extends PokemonDetailState {}

class PokemonLoaded extends PokemonDetailState {
  final PokemonEntity pokemon;

  PokemonLoaded(this.pokemon);

  @override
  List<Object> get props => [pokemon];
}

class PokemonError extends PokemonDetailState {
  final String message;

  PokemonError(this.message);

  @override
  List<Object> get props => [message];
}
