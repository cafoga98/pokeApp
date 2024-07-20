import 'package:json_annotation/json_annotation.dart';

part 'pokemon_detail.g.dart';

@JsonSerializable()
class PokemonDetail {
  final String name;
  final int height;
  final List<Moves> moves;
  final Sprites sprites;
  final List<Type> types;
  final List<Form> forms;

  PokemonDetail({
    required this.name,
    required this.height,
    required this.moves,
    required this.sprites,
    required this.types,
    required this.forms,
  });

  factory PokemonDetail.fromJson(Map<String, dynamic> json) => _$PokemonDetailFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonDetailToJson(this);
}

@JsonSerializable()
class Moves {
  final Move move;

  Moves({required this.move});

  factory Moves.fromJson(Map<String, dynamic> json) => _$MovesFromJson(json);
  Map<String, dynamic> toJson() => _$MovesToJson(this);
}

@JsonSerializable()
class Move {
  final String name;

  Move({required this.name});

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);
  Map<String, dynamic> toJson() => _$MoveToJson(this);
}

@JsonSerializable()
class Sprites {
  @JsonKey(name: 'front_default')
  final String frontDefault;

  Sprites({required this.frontDefault});

  factory Sprites.fromJson(Map<String, dynamic> json) => _$SpritesFromJson(json);
  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}

@JsonSerializable()
class Type {
  final TypeName type;

  Type({required this.type});

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
  Map<String, dynamic> toJson() => _$TypeToJson(this);
}

@JsonSerializable()
class TypeName {
  final String name;

  TypeName({required this.name});

  factory TypeName.fromJson(Map<String, dynamic> json) => _$TypeNameFromJson(json);
  Map<String, dynamic> toJson() => _$TypeNameToJson(this);
}

@JsonSerializable()
class Form {
  final String url;

  Form({required this.url});

  factory Form.fromJson(Map<String, dynamic> json) => _$FormFromJson(json);
  Map<String, dynamic> toJson() => _$FormToJson(this);
}