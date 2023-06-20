import 'package:pokedex_app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PokemonRepositoryImp extends PokemonRepository {
  PokemonRepositoryImp({required this.baseUrl, required this.unencodedPath});

  final String baseUrl;
  final String unencodedPath;

  @override
  Future<List<PokemonEntity>> getPokemonList(int offset, int limit) async {
    List<PokemonEntity> pokemonList = [];
    var client = http.Client();

    final String url =
        "$baseUrl${unencodedPath}pokemon/?offset=$offset&limit=$limit";

    try {
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        for (Map<String, dynamic> item in jsonResponse['results']) {
          var pokemonResponse = await client.get(Uri.parse(item['url']));
          if (pokemonResponse.statusCode == 200) {
            var pokemonJsonResponse = convert.jsonDecode(pokemonResponse.body)
                as Map<String, dynamic>;

            final PokemonEntity pokemon =
                PokemonEntity.fromJson(pokemonJsonResponse);

            pokemonList.add(pokemon);
          }
        }
      }
    } finally {
      client.close();
    }

    return pokemonList;
  }
}
