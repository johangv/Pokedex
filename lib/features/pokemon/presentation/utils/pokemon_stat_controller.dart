import 'package:pokedex_app/features/pokemon/domain/entities/pokemon_entity.dart';

class PokemonStatController {
  PokemonStatController(this.no, this.level, this.types, this.abilities,
      this.height, this.weight);

  final int no;
  int level;
  final List<Types> types;
  final List<Abilities> abilities;
  final int height;
  final int weight;

  //This method will return the pokemon id with 3 digits
  String _getPokemonId() {
    if (no < 10) {
      return '00$no';
    } else if (no < 100) {
      return '0$no';
    } else {
      return '$no';
    }
  }

  //This method will return a string with the pokemon types
  String _getPokemonTypesString() {
    List<String> types = [];

    for (Types type in this.types) {
      types.add(type.type!.name!.toUpperCase());
    }

    return types.join(", ");
  }

  //This method will return a string with the pokemon abilities
  String _getPokemonAbilitiesString() {
    List<String> abilities = [];

    for (Abilities ability in this.abilities) {
      abilities.add(ability.ability!.name!.toUpperCase());
    }

    return abilities.join(", ");
  }

  //This method will return the pokemon height and weight in meters and kilograms
  double _getPokemonHeightAndWeigth(int value) {
    double result = value / 10;
    return result;
  }

  //This method will return a list of maps with the pokemon stats
  List<Map<String, dynamic>> getPokemonStats() {
    List<Map<String, dynamic>> pokemonsStats = [
      {
        'stat': 'NO.',
        'value': _getPokemonId(),
      },
      {
        'stat': 'LEVEL',
        'value': level,
      },
      {
        'stat': 'TYPES',
        'value': _getPokemonTypesString(),
      },
      {
        'stat': 'ABILITIES',
        'value': _getPokemonAbilitiesString(),
      },
      {
        'stat': 'HEIGHT',
        'value': '${_getPokemonHeightAndWeigth(height)} m',
      },
      {
        'stat': 'WEIGHT',
        'value': '${_getPokemonHeightAndWeigth(weight)} Kg',
      },
    ];

    return pokemonsStats;
  }
}
