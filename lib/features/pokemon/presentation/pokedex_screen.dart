import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/dependencies.dart';
import 'package:pokedex_app/features/pokemon/presentation/cubit/pokemon_state.dart';
import 'package:pokedex_app/features/widgets/my_app_bars_widget.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/pokemon_view_widget.dart';

import 'cubit/pokemon_cubit.dart';
import 'cubit/pokemon_status.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen({super.key});

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBars.getPokedexAppBar(context, 'POKÉDEX_'),
      body: BlocProvider(
        create: (_) => getIt<PokemonCubit>()..getPokemonList(),
        child: BlocBuilder<PokemonCubit, PokemonState>(
          builder: (context, state) {
            if (state.status == PokemonStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status == PokemonStatus.success) {
              return Container(
                width: double.infinity,
                color: const Color(0xffbdbdbd),
                child: Column(
                  children: [
                    PokemonViewWidget(pokemon: state.pokemonList[0]),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text(state.error),
              );
            }
          },
        ),
      ),
    );
  }
}
