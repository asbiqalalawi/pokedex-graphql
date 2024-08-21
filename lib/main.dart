import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokedex_graphql/core/route/route.dart';
import 'package:pokedex_graphql/core/style/colors.dart';
import 'package:pokedex_graphql/data/datasource/pokemon_remote_datasource.dart';
import 'package:pokedex_graphql/data/repository/pokemon_repository.dart';
import 'package:pokedex_graphql/domain/usecases/get_pokemon_usecase.dart';
import 'package:pokedex_graphql/domain/usecases/get_pokemons_usecase.dart';
import 'package:pokedex_graphql/persentation/bloc/pokemon_bloc.dart';
import 'package:pokedex_graphql/persentation/bloc/pokemon_detail_bloc.dart';

final getIt = GetIt.instance;

void main() async {
  await initHiveForFlutter(); // Initialize Hive for caching
  final HttpLink httpLink = HttpLink('https://graphql-pokemon2.vercel.app');

  final GraphQLClient client = GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(store: HiveStore()),
  );

  // Register dependencies in GetIt
  getIt.registerLazySingleton(() => client);
  getIt.registerLazySingleton<PokemonRemoteDataSource>(() => PokemonRemoteDataSourceImpl(getIt<GraphQLClient>()));
  getIt.registerLazySingleton(() => PokemonRepository(getIt<PokemonRemoteDataSource>()));
  getIt.registerLazySingleton(() => GetPokemonsUseCase(getIt<PokemonRepository>()));
  getIt.registerLazySingleton(() => GetPokemonUseCase(getIt<PokemonRepository>()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PokemonBloc(getIt<GetPokemonsUseCase>())),
        BlocProvider(create: (_) => PokemonDetailBloc(getIt<GetPokemonUseCase>())),
      ],
      child: MaterialApp.router(
        title: 'Pokedex',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Identity.primary),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
