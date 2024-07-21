import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_app/features/pokemon_list/data/services/implementation/pokemon_service.dart';
import 'package:poke_app/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:poke_app/features/pokemon_list/domain/entities/pokemon_detail.dart';
import 'package:poke_app/generated/l10n.dart';

import '../../mocks/api_config/mock_api_config.mocks.dart';
import '../../mocks/environment_config/mock_environment_config.mocks.dart';
import '../../resources/json/fixture.dart';

void main() {
  late MockEnvironmentConfig environmentConfig;
  late MockApiConfig mockApiConfig;
  late PokemonService pokemonService;

  const baseUrl = 'https://any';

  int page = 0;
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    S.load(const Locale('en'));

    environmentConfig = MockEnvironmentConfig();
    mockApiConfig = MockApiConfig();
    pokemonService = PokemonService(mockApiConfig, environmentConfig);
  });

  group('PokemonService', () {
    final pokemonJsonResponse = json.decode(fixture('pokemon'));
    test('(fetchPokemons) Should return the pokemon list', () async {
      when(environmentConfig.apiBase).thenReturn(baseUrl);

      when(mockApiConfig.apiGet(any))
          .thenAnswer((_) async => pokemonJsonResponse);

      final response = await pokemonService.fetchPokemons(page: page);

      expect(response, isA<List<Pokemon>>());
    });

    final detailJsonResponse = json.decode(fixture('pokemon_detail'));
    test('(fetchPokemonDetail) Should return the pokemon detail', () async {
      when(environmentConfig.apiBase).thenReturn(baseUrl);

      when(mockApiConfig.apiGet(any))
          .thenAnswer((_) async => detailJsonResponse);

      final response = await pokemonService.fetchPokemonDetail(
          url: 'https://pokeapi.co/api/v2/pokemon/7/');

      expect(response, isA<PokemonDetail>());
    });
  });
}
