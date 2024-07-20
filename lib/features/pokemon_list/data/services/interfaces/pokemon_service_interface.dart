import 'package:poke_app/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:poke_app/features/pokemon_list/domain/entities/pokemon_detail.dart';

abstract class PokemonServiceInterface {
  Future<List<Pokemon>> fetchPokemons({required int page});

  Future<PokemonDetail> fetchPokemonDetail({required String url});
}