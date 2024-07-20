import 'package:dartz/dartz.dart';
import 'package:poke_app/features/pokemon_list/data/repositories/interfaces/pokemon_repository_interface.dart';
import 'package:poke_app/features/pokemon_list/data/services/implementation/pokemon_service.dart';
import 'package:poke_app/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:poke_app/features/pokemon_list/domain/entities/pokemon_detail.dart';

import '/generated/l10n.dart';
import '/core/shared/error_handle/failure.dart';
import '/core/shared/error_handle/exceptions.dart';

class PokemonRepository extends PokemonRepositoryInterfaces {
  final PokemonService pokemonListService;

  PokemonRepository({
    required this.pokemonListService,
  });

  @override
  Future<Either<Failure, PokemonDetail>> fetchPokemonDetail(
      {required String url}) async {
    try {
      final response = await pokemonListService.fetchPokemonDetail(url: url);
      return right(response);
    } on NoConnectionException catch (e) {
      return left(Failure.noConnection(message: e.message));
    } on NoDataException catch (_) {
      return left(Failure.noData(message: S.current.noData));
    } catch (e) {
      return left(Failure.noActionComplete(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Pokemon>>> fetchPokemons(
      {required int page}) async {
    try {
      final response = await pokemonListService.fetchPokemons(page: page);
      return right(response);
    } on NoConnectionException catch (e) {
      return left(Failure.noConnection(message: e.message));
    } on NoDataException catch (_) {
      return left(Failure.noData(message: S.current.noData));
    } catch (e) {
      return left(Failure.noActionComplete(message: e.toString()));
    }
  }
}
