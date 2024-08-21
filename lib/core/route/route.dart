import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_graphql/persentation/pages/pokemon_detail_screen.dart';
import 'package:pokedex_graphql/persentation/pages/pokemon_list_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'list-pokemon',
      builder: (BuildContext context, GoRouterState state) {
        return const PokemonListScreen();
      },
      routes: [
        GoRoute(
          path: 'pokemon/:id',
          name: 'pokemon-detail',
          builder: (BuildContext context, GoRouterState state) {
            return PokemonDetailScreen(id: state.pathParameters['id'] as String);
          },
        ),
      ],
    ),
  ],
);
