import 'package:poke_app/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:poke_app/features/pokemon_list/domain/entities/pokemon_detail.dart';

Pokemon pokemonStub = Pokemon(
  name: 'squirtle',
  url: 'https://pokeapi.co/api/v2/pokemon/7/',
  imageUrl: '',
  types: [
    Type(
      type: TypeName(
        name: 'bug',
      ),
    ),
  ],
);

PokemonDetail pokemonDetailStub = PokemonDetail(
  name: 'squirtle',
  height: 5,
  moves: [
    Moves(
      move: Move(
        name: 'electroweb',
      ),
    ),
  ],
  sprites: Sprites(frontDefault: 'sprites'),
  types: [
    Type(
      type: TypeName(
        name: 'bug',
      ),
    ),
  ],
  forms: [
    Form(
      url:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/7.png',
    ),
  ],
);
