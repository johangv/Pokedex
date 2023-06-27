import 'package:pokedex_app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/features/pokemon/presentation/cubit/pokemon_status.dart';

class PokemonState {
  const PokemonState(
      {required this.status,
      required this.pokemonList,
      required this.error,
      required this.pokemonIndex});

  factory PokemonState.initialState() => const PokemonState(
        status: PokemonStatus.initial,
        pokemonList: [],
        error: '',
        pokemonIndex: 0,
      );

  final PokemonStatus status;
  final List<PokemonEntity> pokemonList;
  final String error;
  final int pokemonIndex;

  PokemonState copyWith({
    PokemonStatus? status,
    List<PokemonEntity>? pokemonList,
    String? error,
    int? pokemonIndex,
  }) =>
      PokemonState(
        status: status ?? this.status,
        pokemonList: pokemonList ?? this.pokemonList,
        error: error ?? this.error,
        pokemonIndex: pokemonIndex ?? this.pokemonIndex,
      );
}
