import 'package:pokedex_app/features/pokemon/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<List<PokemonEntity>> getPokemonList(int offset, int limit);
}
