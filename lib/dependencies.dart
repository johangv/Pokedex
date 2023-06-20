import 'package:get_it/get_it.dart';
import 'package:pokedex_app/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokedex_app/features/pokemon/presentation/cubit/lazy_pokemon_load_cubit.dart';
import 'package:pokedex_app/features/pokemon/presentation/cubit/pokemon_cubit.dart';

import 'features/pokemon/data/local/pokemon_repository_imp.dart';

//Api Client
const String baseUrl = 'http://pokeapi.co';
const String unencodedPath = '/api/v2/';

final getIt = GetIt.instance;

void setup() {
  //Pokemon
  getIt.registerFactory<PokemonRepository>(() =>
      PokemonRepositoryImp(baseUrl: baseUrl, unencodedPath: unencodedPath));
  getIt.registerFactory<PokemonCubit>(() => PokemonCubit(getIt()));
  getIt.registerFactory<LazyPokemonCubit>(() => LazyPokemonCubit(getIt()));
}
