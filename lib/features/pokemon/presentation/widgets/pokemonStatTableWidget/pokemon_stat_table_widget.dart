import 'package:flutter/material.dart';
import 'package:pokedex_app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/pokemonStatTableWidget/pokemon_stat_item_widget.dart';
import '../../utils/pokemon_stat_controller.dart';

class PokemonStatTableWidget extends StatelessWidget {
  final PokemonEntity pokemon;
  const PokemonStatTableWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final PokemonStatController pokemonStatController = PokemonStatController(
      pokemon.id!,
      pokemon.baseExperience!,
      pokemon.types!,
      pokemon.abilities!,
      pokemon.height!,
      pokemon.weight!,
    );

    List<Map<String, dynamic>> pokemonStats =
        pokemonStatController.getPokemonStats();

    return Container(
      height: 290.0,
      width: 340.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: <PokemonStatItemWidget>[
          for (Map<String, dynamic> pokemonStat in pokemonStats)
            PokemonStatItemWidget(
              stat: pokemonStat['stat'],
              value: pokemonStat['value'].toString(),
            ),
        ],
      ),
    );
  }
}
