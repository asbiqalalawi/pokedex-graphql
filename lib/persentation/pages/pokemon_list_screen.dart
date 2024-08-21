import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_graphql/core/const/dropdown_data.dart';
import 'package:pokedex_graphql/core/style/colors.dart';
import 'package:pokedex_graphql/core/style/elevation.dart';
import 'package:pokedex_graphql/core/style/typography.dart';
import 'package:pokedex_graphql/domain/entities/pokemon_entity.dart';
import 'package:pokedex_graphql/persentation/widgets/pokemon_card.dart';
import '../bloc/pokemon_bloc.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  final int _itemsPerPage = 20;
  String? _selectedType;

  @override
  void initState() {
    super.initState();
    context.read<PokemonBloc>().add(FetchPokemons(_itemsPerPage));
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      context.read<PokemonBloc>().add(FetchPokemons(_itemsPerPage * ++_currentPage));
    }
  }

  void _onTypeSelected(String? type) {
    setState(() {
      _selectedType = type;
    });
    context.read<PokemonBloc>().add(FilterPokemonsByType(type ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Identity.primary,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_pokeball.svg',
                    width: 24,
                    colorFilter: const ColorFilter.mode(
                      GrayScale.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Pokédex',
                      style: Header.headline.copyWith(color: GrayScale.white),
                    ),
                  ),
                  if (_selectedType != null)
                    IconButton(
                      onPressed: () {
                        context.read<PokemonBloc>().add(ResetFilter());
                        setState(() {
                          _selectedType = null;
                        });
                      },
                      icon: const Icon(
                        Icons.refresh,
                        color: GrayScale.white,
                      ),
                    ),
                  DropdownButton<String>(
                    value: _selectedType,
                    style: Header.subtitle1.copyWith(color: GrayScale.white),
                    hint: Text('Filter by Type ', style: Header.subtitle1.copyWith(color: GrayScale.white)),
                    dropdownColor: Identity.primary,
                    icon: const Icon(Icons.filter_list, color: GrayScale.white),
                    onChanged: _onTypeSelected,
                    items: DropdownData.pokemonTypes
                        .map((type) => DropdownMenuItem<String>(
                              value: type,
                              child: Text(type),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  boxShadow: InnerShadow.dp2,
                  borderRadius: BorderRadius.circular(8),
                  color: GrayScale.white,
                ),
                child: BlocBuilder<PokemonBloc, PokemonState>(
                  builder: (context, state) {
                    if (state is PokemonLoading && state.isFirstFetch) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is PokemonLoaded) {
                      return _buildPokemonGrid(state, state.pokemons);
                    } else if (state is PokemonLoading) {
                      return _buildPokemonGrid(state, state.oldPokemons);
                    } else if (state is PokemonError) {
                      return Center(child: Text(state.message));
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPokemonGrid(PokemonState state, List<PokemonEntity> pokemons) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          const SizedBox(height: 24),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 12,
              crossAxisCount: 3,
              crossAxisSpacing: 6,
            ),
            itemCount: pokemons.length,
            itemBuilder: (BuildContext context, int index) {
              return PokemonCard(pokemon: pokemons[index]);
            },
          ),
          const SizedBox(height: 24),
          if (state is PokemonLoading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
