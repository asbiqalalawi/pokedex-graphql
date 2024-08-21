import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex_graphql/domain/entities/pokemon_entity.dart';
import 'package:pokedex_graphql/domain/usecases/get_pokemon_usecase.dart';


part 'pokemon_detail_event.dart';
part 'pokemon_detail_state.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  final GetPokemonUseCase getPokemonsUseCase;

  PokemonDetailBloc(this.getPokemonsUseCase) : super(PokemonInitial()) {
    on<FetchPokemon>((event, emit) async {
      emit(PokemonLoading());
      try {
        final pokemons = await getPokemonsUseCase.execute(event.id);
        emit(PokemonLoaded(pokemons));
      } catch (e) {
        emit(PokemonError(e.toString()));
      }
    });
  }
}
