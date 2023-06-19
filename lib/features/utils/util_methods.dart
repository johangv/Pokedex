import 'package:flutter/material.dart';

//This method capitalize the first letter of a string
String capitalizeFirstLetter(String text) {
  if (text.isEmpty) {
    return text;
  }

  return text[0].toUpperCase() + text.substring(1);
}

//This method gets the pokemon type string and evaluate which type image should be returned
AssetImage getPokemonTypeImage(String type) {
  const String defaultRoute = 'assets/images/types/';

  switch (type) {
    case "grass":
      return const AssetImage('${defaultRoute}grass_type.webp');
    case "poison":
      return const AssetImage('${defaultRoute}poison_type.webp');
    case "fire":
      return const AssetImage('${defaultRoute}fire_type.webp');
    case "flying":
      return const AssetImage('${defaultRoute}flying_type.webp');
    case "water":
      return const AssetImage('${defaultRoute}water_type.webp');
    case "bug":
      return const AssetImage('${defaultRoute}bug_type.webp');
    case "normal":
      return const AssetImage('${defaultRoute}normal_type.webp');
    case "electric":
      return const AssetImage('${defaultRoute}electric_type.webp');
    case "rock":
      return const AssetImage('${defaultRoute}rock_type.webp');
    case "dark":
      return const AssetImage('${defaultRoute}dark_type.webp');
    case "steel":
      return const AssetImage('${defaultRoute}steel_type.webp');
    case "dragon":
      return const AssetImage('${defaultRoute}dragon_type.webp');
    case "psychic":
      return const AssetImage('${defaultRoute}psychic_type.webp');
    case "ghost":
      return const AssetImage('${defaultRoute}ghost_type.webp');
    case "fairy":
      return const AssetImage('${defaultRoute}fairy_type.webp');
    case "ice":
      return const AssetImage('${defaultRoute}ice_type.webp');
    default:
      return const AssetImage('${defaultRoute}no_icon.png');
  }
}
