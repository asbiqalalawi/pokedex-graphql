import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex_graphql/domain/entities/pokemon_entity.dart';
import 'package:pokedex_graphql/domain/usecases/get_pokemons_usecase.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final GetPokemonsUseCase getPokemonsUseCase;
  List<PokemonEntity> _allPokemons = [];
  List<PokemonEntity> _filteredPokemons = [];
  String? _currentFilter;

  PokemonBloc(this.getPokemonsUseCase) : super(PokemonInitial()) {
    on<FetchPokemons>((event, emit) async {
      emit(PokemonLoading(_filteredPokemons, isFirstFetch: _filteredPokemons.isEmpty));

      try {
        final newPokemons = await getPokemonsUseCase.execute(event.first);

        final existingIds = _allPokemons.map((p) => p.id).toSet();
        final uniqueNewPokemons = newPokemons.where((p) => !existingIds.contains(p.id)).toList();

        _allPokemons = [..._allPokemons, ...uniqueNewPokemons];
        _applyFilter();

        emit(PokemonLoaded(_filteredPokemons, filterType: _currentFilter));
      } catch (error) {
        emit(PokemonError(error.toString()));
      }
    });

    on<FilterPokemonsByType>((event, emit) async {
      _currentFilter = event.type;
      _applyFilter();
      emit(PokemonLoaded(_filteredPokemons, filterType: event.type));
    });

    on<ResetFilter>((event, emit) async {
      _currentFilter = null;
      _applyFilter();
      emit(PokemonLoaded(_filteredPokemons, filterType: null));
    });
  }

  void _applyFilter() {
    if (_currentFilter != null) {
      _filteredPokemons = _allPokemons.where((pokemon) => pokemon.types.contains(_currentFilter!)).toList();
    } else {
      _filteredPokemons = List.from(_allPokemons);
    }
  }
}
