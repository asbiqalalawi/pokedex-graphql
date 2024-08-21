import 'package:flutter/material.dart';
import 'package:pokedex_graphql/core/style/colors.dart';
import 'package:pokedex_graphql/core/style/typography.dart';

class PokemonTypeLabel extends StatelessWidget {
  final String typeName;

  const PokemonTypeLabel({super.key, required this.typeName});

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor = PokemonType.getColor(typeName.toLowerCase());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        typeName,
        style: Header.subtitle3.copyWith(color: Colors.white),
      ),
    );
  }
}