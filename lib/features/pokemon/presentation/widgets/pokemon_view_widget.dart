import 'package:flutter/material.dart';
import 'package:pokedex_app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/pokemonStatTableWidget/pokemon_stat_table_widget.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/pokemon_image_loader_widget.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/pokemon_type_bar_widget.dart';

class PokemonViewWidget extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonViewWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Bar with pokemon name and types
          PokemonTypeBarWidget(name: pokemon.name!, types: pokemon.types!),
          SizedBox(
            height: 500.0,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                //Selected pokemon Table with stats
                Positioned(
                    bottom: 0.0,
                    child: PokemonStatTableWidget(pokemon: pokemon)),
                //Selected pokemon image
                Positioned(
                  top: 20.0,
                  child: PokemonImageLoader(
                    url: pokemon.sprites!.other!.officialArtwork!.frontDefault!,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
