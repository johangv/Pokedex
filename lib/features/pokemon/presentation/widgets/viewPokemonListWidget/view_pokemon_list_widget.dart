import 'package:flutter/material.dart';
import 'package:pokedex_app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/viewPokemonListWidget/pokemon_button_widget.dart';

import '../../../../utils/app_colors.dart';

class ViewPokemonListWidget extends StatefulWidget {
  final List<PokemonEntity> pokemonList;
  final Function(int selectedIndex) setSelectedIndex;
  const ViewPokemonListWidget(
      {super.key, required this.pokemonList, required this.setSelectedIndex});

  @override
  State<ViewPokemonListWidget> createState() => _ViewPokemonListWidgetState();
}

class _ViewPokemonListWidgetState extends State<ViewPokemonListWidget> {
  int selectedIndex = -1;
  final AppColors appColors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
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
              )),
          Container(
            height: 250.0,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 55.0, right: 50.0),
            //Create the grid with my pokemons
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.85,
                crossAxisCount: 2,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: (widget.pokemonList.length / 4).ceil() * 2, //Two rows
              itemBuilder: (BuildContext context, int index) {
                final buttonIndex = index ~/ 2 * 2 + (index % 2);
                if (buttonIndex >= widget.pokemonList.length) {
                  //To fill the empty spaces if there are not enought elements
                  return const SizedBox();
                }
                final pokemon = widget.pokemonList[buttonIndex];
                final isSelected = buttonIndex == selectedIndex;
                return PokemonButtonWidget(
                  imageUrl:
                      pokemon.sprites!.other!.officialArtwork!.frontDefault!,
                  isSelected: isSelected,
                  onTap: () {
                    setState(() {
                      selectedIndex = buttonIndex;
                    });
                    widget.setSelectedIndex(selectedIndex);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
