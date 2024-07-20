import 'package:json_annotation/json_annotation.dart';
import 'package:poke_app/features/pokemon_list/domain/entities/pokemon_detail.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  final String name;
  final String url;
  late String? imageUrl;
  late List<Type>? types;

  Pokemon({
    required this.name,
    required this.url,
    required this.imageUrl,
    required this.types,
  }) {
    final id = url.split('/').where((element) => element.isNotEmpty).last;
    imageUrl =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
    types = [];
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  Pokemon copyWith({
    String? name,
    String? url,
    String? imageUrl,
    List<Type>? types,
  }) {
    return Pokemon(
      name: name ?? this.name,
      url: url ?? this.url,
      imageUrl: imageUrl ?? this.imageUrl,
      types: types ?? this.types,
    );
  }
}
