import 'package:flutter/material.dart';
import 'package:pokedex_app/features/pokemon/domain/entities/pokemon_entity.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/util_methods.dart';

class PokemonTypeBarWidget extends StatelessWidget {
  final String name;
  final List<Types> types;
  const PokemonTypeBarWidget(
      {super.key, required this.name, required this.types});

  @override
  Widget build(BuildContext context) {
    List<Image> pokemonTypeImages = [];
    final AppColors appColors = AppColors();

    //Get my list of the selected type pokemon images
    for (Types type in types) {
      Image image = Image(
        image: getPokemonTypeImage(type.type!.name!),
        width: 40.0,
      );
      pokemonTypeImages.add(image);
    }

    return Container(
      height: 60.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Put my list of type images in the row
          ...pokemonTypeImages,
          const SizedBox(width: 10.0),
          Text(
            name.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: appColors.darkGray,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
