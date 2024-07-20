import 'dart:convert';

import 'package:poke_app/features/pokemon_list/data/services/interfaces/pokemon_service_interface.dart';
import 'package:poke_app/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:poke_app/features/pokemon_list/domain/entities/pokemon_detail.dart';

import '/core/shared/config/api_config.dart';
import '/core/shared/config/environment_config.dart';

/// PokemonListService Class
///
/// Implements the [PokemonServiceInterface] to handle login-related network requests
/// and communicates with the server. It uses the provided [ApiConfig] and [EnvironmentConfig].
///
/// Example usage:
///
/// ```dart
/// final pokemonListService = PokemonListService(apiConfig, environmentConfig);
/// ```
class PokemonService extends PokemonServiceInterface {
  final ApiConfig apiConfig;
  final EnvironmentConfig environmentConfig;

  PokemonService(
    this.apiConfig,
    this.environmentConfig,
  );

  @override
  Future<List<Pokemon>> fetchPokemons({required int page}) async {
    try {
      var response = await apiConfig.apiGet(
          '${environmentConfig.apiBase}/pokemon?limit=20&offset=${page * 20}');
      return List.from(
        (response['results'] as List).map(
          (e) => Pokemon.fromJson(e),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PokemonDetail> fetchPokemonDetail({required String url}) async {
    try {
      var response = await apiConfig.apiGet(url);
      return PokemonDetail.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Pokemon> searchPokemons({required String name}) async {
    try {
      var response = await apiConfig.apiGet(
          '${environmentConfig.apiBase}/pokemon/$name/');
      final detail = PokemonDetail.fromJson(response);
      return Pokemon(name: detail.name, url: '${environmentConfig.apiBase}/pokemon/${response['id']}/', imageUrl: null, types: detail.types);
    } catch (e) {
      rethrow;
    }
  }
}
