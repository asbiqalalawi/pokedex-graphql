import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_graphql/core/style/colors.dart';
import 'package:pokedex_graphql/core/style/elevation.dart';
import 'package:pokedex_graphql/core/style/typography.dart';
import 'package:pokedex_graphql/domain/entities/pokemon_entity.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed('pokemon-detail', pathParameters: {'id': pokemon.id});
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: GrayScale.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: DropShadow.dp2,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '#${pokemon.number}',
                  style: Body.caption,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            CachedNetworkImage(
              imageUrl: pokemon.image,
              width: 70,
              height: 70,
            ),
            Text(
              pokemon.name,
              style: Body.body3,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
