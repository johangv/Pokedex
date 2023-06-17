class PokemonEntity {
  final int? id;
  final int? baseExperience;
  final String? name;
  final int? weight;
  final int? height;
  final List<Abilities>? abilities;
  final List<Types>? types;
  final Sprites? sprites;

  PokemonEntity({
    this.baseExperience,
    this.id,
    this.name,
    this.weight,
    this.height,
    this.abilities,
    this.types,
    this.sprites,
  });

  PokemonEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        baseExperience = json['base_experience'],
        name = json['name'],
        weight = json['weight'],
        height = json['height'],
        abilities = (json['abilities'] as List<dynamic>)
            .map((e) => Abilities.fromJson(e))
            .toList(),
        types = (json['types'] as List<dynamic>)
            .map((e) => Types.fromJson(e))
            .toList(),
        sprites = Sprites.fromJson(json['sprites']);
}

class Abilities {
  final Ability? ability;
  final int? slot;

  Abilities({this.ability, this.slot});

  Abilities.fromJson(Map<String, dynamic> json)
      : ability = Ability.fromJson(json['ability']),
        slot = json['slot'];
}

class Ability {
  final String? name;

  Ability({this.name});

  Ability.fromJson(Map<String, dynamic> json) : name = json['name'];
}

class Types {
  final int? slot;
  final Ability? type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json)
      : slot = json['slot'],
        type = Ability.fromJson(json['type']);
}

class Sprites {
  final OtherSprite? other;

  Sprites({this.other});

  Sprites.fromJson(Map<String, dynamic> json)
      : other = OtherSprite.fromJson(json['other']);
}

class OtherSprite {
  final OfficialArtwork? officialArtwork;

  OtherSprite({this.officialArtwork});

  OtherSprite.fromJson(Map<String, dynamic> json)
      : officialArtwork = OfficialArtwork.fromJson(json['official-artwork']);
}

class OfficialArtwork {
  OfficialArtwork({this.frontDefault});

  final String? frontDefault;

  OfficialArtwork.fromJson(Map<String, dynamic> json)
      : frontDefault = json['front_default'];
}
