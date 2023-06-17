import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/dependencies.dart';
import 'package:pokedex_app/features/pokemon/presentation/cubit/pokemon_state.dart';

import 'cubit/pokemon_cubit.dart';
import 'cubit/pokemon_status.dart';

class PokedexScreen extends StatelessWidget {
  const PokedexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: BlocProvider(
        create: (_) => getIt<PokemonCubit>(),
        child: BlocConsumer<PokemonCubit, PokemonState>(
          listener: (context, state) {
            if (state.status == PokemonStatus.error) {
              print(state.error);
            } else if (state.status == PokemonStatus.success) {
              print(state.pokemonList);
            }
          },
          builder: (context, state) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<PokemonCubit>().getPokemonList();
                },
                child: const Text('Pokemon List'),
              ),
            );
          },
        ),
      ),
    );
  }
}
