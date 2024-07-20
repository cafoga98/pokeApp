import 'package:dartz/dartz.dart';
import 'package:poke_app/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:poke_app/features/pokemon_list/domain/entities/pokemon_detail.dart';

import '/core/shared/error_handle/failure.dart';

abstract class PokemonRepositoryInterfaces {
  Future<Either<Failure, List<Pokemon>>> fetchPokemons({required int page});

  Future<Either<Failure, PokemonDetail>> fetchPokemonDetail(
      {required String url});

  Future<Either<Failure, List<Pokemon>>> searchPokemon(
      {required String name});
}
