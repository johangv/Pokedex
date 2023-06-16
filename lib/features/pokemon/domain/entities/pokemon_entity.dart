class PokemonEntity {
  final int? id;
  final String? name;
  final int? weight;
  final int? height;
  final List<Abilities>? abilities;
  final List<Types>? types;
  final Sprites? sprites;

  PokemonEntity({
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
        name = json['name'],
        weight = json['weight'],
        height = json['height'],
        abilities = json['abilities'],
        types = json['types'],
        sprites = json['sprites'];
}

class Abilities {
  final Ability? ability;
  final int? slot;

  Abilities({this.ability, this.slot});

  Abilities.fromJson(Map<String, dynamic> json)
      : ability = json['ability'],
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
        type = json['type'];
}

class Sprites {
  final OtherSprite? other;

  Sprites({this.other});

  Sprites.fromJson(Map<String, dynamic> json) : other = json['other'];
}

class OtherSprite {
  final OfficialArtwork? officialArtwork;

  OtherSprite({this.officialArtwork});

  OtherSprite.fromJson(Map<String, dynamic> json)
      : officialArtwork = json['official-artwork'];
}

class OfficialArtwork {
  OfficialArtwork({this.frontDefault});

  final String? frontDefault;

  OfficialArtwork.fromJson(Map<String, dynamic> json)
      : frontDefault = json['front_default'];
}
