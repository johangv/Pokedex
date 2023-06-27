import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/features/pokemon/presentation/cubit/pokemon_state.dart';
import 'package:pokedex_app/features/pokemon/presentation/cubit/pokemon_status.dart';

import '../../domain/repositories/pokemon_repository.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit(this._pokemonRepository) : super(PokemonState.initialState());

  final PokemonRepository _pokemonRepository;

  void getPokemonList() async {
    emit(state.copyWith(status: PokemonStatus.loading));

    try {
      final List<PokemonEntity> pokemonList =
          await _pokemonRepository.getPokemonList(0, 20);
      emit(state.copyWith(
          status: PokemonStatus.success, pokemonList: pokemonList));
    } catch (e) {
      emit(state.copyWith(status: PokemonStatus.error, error: e.toString()));
    }
  }

  void updatePokemonList(int offset, int limit) async {
    try {
      final List<PokemonEntity> pokemonList =
          await _pokemonRepository.getPokemonList(offset, limit);
      emit(state.copyWith(
          status: PokemonStatus.success, pokemonList: pokemonList));
    } catch (e) {
      emit(state.copyWith(status: PokemonStatus.error, error: e.toString()));
    }
  }

  void updateSelectedPokemon(int selectedIndex) async {
    emit(state.copyWith(
        status: PokemonStatus.success, pokemonIndex: selectedIndex));
  }
}
