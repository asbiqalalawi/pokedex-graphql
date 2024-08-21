import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_graphql/core/style/colors.dart';
import 'package:pokedex_graphql/core/style/elevation.dart';
import 'package:pokedex_graphql/core/style/typography.dart';
import 'package:pokedex_graphql/domain/entities/pokemon_entity.dart';
import 'package:pokedex_graphql/persentation/bloc/pokemon_detail_bloc.dart';
import 'package:pokedex_graphql/persentation/widgets/pokemon_type_label.dart';

class PokemonDetailScreen extends StatefulWidget {
  const PokemonDetailScreen({super.key, required this.id});

  final String id;

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  void initState() {
    context.read<PokemonDetailBloc>().add(FetchPokemon(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
      builder: (context, state) {
        if (state is PokemonLoaded) {
          final pokemon = state.pokemon;
          final color = PokemonType.getColor(state.pokemon.types.first.toLowerCase());

          return Scaffold(
            backgroundColor: color,
            body: Stack(
              children: [
                Positioned(
                  top: 40,
                  right: 20,
                  child: SvgPicture.asset(
                    'assets/icons/ic_pokeball.svg',
                    width: 208,
                    height: 208,
                    colorFilter: ColorFilter.mode(
                      GrayScale.white.withOpacity(0.1),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                SafeArea(
                  child: Stack(
                    children: [
                      _detailCard(context, color, pokemon),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: SvgPicture.asset(
                                    'assets/icons/ic_arrow_back.svg',
                                    width: 32,
                                    height: 32,
                                    colorFilter: const ColorFilter.mode(
                                      GrayScale.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                                Text(
                                  pokemon.name,
                                  style: Header.headline.copyWith(color: GrayScale.white),
                                ),
                                const Spacer(),
                                Text(
                                  pokemon.number,
                                  style: Header.subtitle2.copyWith(color: GrayScale.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is PokemonError) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text(state.message),
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget _detailCard(BuildContext context, Color color, PokemonEntity pokemon) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 60, 4, 4),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        boxShadow: InnerShadow.dp2,
        borderRadius: BorderRadius.circular(8),
        color: GrayScale.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: pokemon.image,
                width: 200,
                height: 200,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: SizedBox(
              height: 20,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: pokemon.types.length,
                itemBuilder: (context, index) => PokemonTypeLabel(typeName: pokemon.types[index]),
                separatorBuilder: (context, index) => const SizedBox(width: 16),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              'About',
              style: Header.subtitle1.copyWith(color: color),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 32,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ic_weight.svg',
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${pokemon.weight['minimum'] ?? ''} - ${pokemon.weight['maximum'] ?? ''}',
                          style: Body.body3,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Weight',
                    style: Body.caption,
                  ),
                ],
              ),
              Container(
                width: 1,
                height: 48,
                color: GrayScale.light,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 32,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ic_straighten.svg',
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${pokemon.height['minimum'] ?? ''} - ${pokemon.height['maximum'] ?? ''}',
                          style: Body.body3,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Height',
                    style: Body.caption,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Text(
                'Weaknesses',
                style: Header.subtitle1,
              ),
              const SizedBox(width: 16),
              SizedBox(
                height: 20,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: pokemon.types.length,
                  itemBuilder: (context, index) => PokemonTypeLabel(typeName: pokemon.weaknesses[index]),
                  separatorBuilder: (context, index) => const SizedBox(width: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                'Resistant',
                style: Header.subtitle1,
              ),
              const SizedBox(width: 16),
              SizedBox(
                height: 20,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: pokemon.types.length,
                  itemBuilder: (context, index) => PokemonTypeLabel(typeName: pokemon.resistant[index]),
                  separatorBuilder: (context, index) => const SizedBox(width: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
