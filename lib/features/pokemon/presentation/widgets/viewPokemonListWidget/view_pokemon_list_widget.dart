import 'package:flutter/material.dart';
import 'package:pokedex_app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/viewPokemonListWidget/pokemon_scroll_widget.dart';
import '../../../../utils/app_colors.dart';

class ViewPokemonListWidget extends StatelessWidget {
  final List<PokemonEntity> pokemonList;
  const ViewPokemonListWidget({super.key, required this.pokemonList});

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = AppColors();

    return Container(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
            child: Text(
              "OTHERS",
              style: TextStyle(
                  color: appColors.darkGray,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          ),
          PokemonScrollWidget(pokemonList: pokemonList)
        ],
      ),
    );
  }
}
