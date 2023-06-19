import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/dependencies.dart';
import 'package:pokedex_app/features/pokemon/presentation/cubit/pokemon_state.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/viewPokemonListWidget/view_pokemon_list_widget.dart';
import 'package:pokedex_app/features/utils/app_colors.dart';
import 'package:pokedex_app/features/widgets/charging_animation.dart';
import 'package:pokedex_app/features/widgets/my_app_bars_widget.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/pokemon_view_widget.dart';

import '../../widgets/errorMessage/error_message.dart';
import '../../widgets/errorMessage/reload_button.dart';
import 'cubit/pokemon_cubit.dart';
import 'cubit/pokemon_status.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen({super.key});

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  int selectedIndex = 0;
  final AppColors appColors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.lightGray,
      appBar: MyAppBars.getPokedexAppBar(context, 'POKÉDEX_'),
      body: BlocProvider(
        create: (_) => getIt<PokemonCubit>()..getPokemonList(),
        child: BlocBuilder<PokemonCubit, PokemonState>(
          builder: (context, state) {
            if (state.status == PokemonStatus.loading) {
              return const ChargingAnimation();
            } else if (state.status == PokemonStatus.success) {
              final selectedPokemon = state.pokemonList[selectedIndex];
              void setSelectedItem(int newIndex) {
                setState(() {
                  selectedIndex = newIndex;
                });
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    //Pokemon selected view with name, photo and stats table
                    PokemonViewWidget(pokemon: selectedPokemon),
                    //Pokemon list view
                    const SizedBox(
                      height: 10.0,
                    ),
                    ViewPokemonListWidget(
                        pokemonList: state.pokemonList,
                        setSelectedIndex: setSelectedItem),
                  ],
                ),
              );
            } else {
              return ErrorMessage(
                errorMessage: state.error,
                reloadButton: ReloadButton(
                    text: "Try reloading",
                    onPressed: () {
                      context.read<PokemonCubit>().getPokemonList();
                    }),
              );
            }
          },
        ),
      ),
    );
  }
}
