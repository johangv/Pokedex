import 'package:flutter/material.dart';
import 'package:pokedex_app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/pokemon_stat_table_widget.dart';
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
          Stack(
            children: [
              //Table with stats
              PokemonStatTableWidget(pokemon: pokemon),
            ],
          ),
        ],
      ),
    );
  }
}
