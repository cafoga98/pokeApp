import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_app/core/shared/error_handle/failure.dart';
import 'package:poke_app/features/pokemon_list/domain/blocs/pokemon_bloc/pokemon_bloc.dart';
import 'package:poke_app/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:poke_app/features/pokemon_list/domain/entities/pokemon_detail.dart';
import 'package:poke_app/generated/l10n.dart';

import '../../../../mocks/pokemon/mock_pokemon_repository.mocks.dart';
import '../../../../resources/json/fixture.dart';

void main() {
  late MockPokemonRepository mockPokemonRepository;
  late PokemonBloc pokemonBloc;

  late Failure fetchFailure;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    S.load(const Locale('en'));

    mockPokemonRepository = MockPokemonRepository();

    pokemonBloc = PokemonBloc(pokemonRepository: mockPokemonRepository);

    fetchFailure = const ServerFailure(message: 'Failed to fetch Pokémon');
  });

  group('PokemonBloc', () {
    group('FetchPokemons Event', () {
      final pokemonJsonResponse = json.decode(fixture('pokemon'));

      List<Pokemon> pokemonListResponse = List.from(
        (pokemonJsonResponse['results'] as List).map(
          (e) => Pokemon.fromJson(e),
        ),
      );

      final detailJsonResponse = json.decode(fixture('pokemon_detail'));

      PokemonDetail pokemonDetail = PokemonDetail.fromJson(detailJsonResponse);

      blocTest<PokemonBloc, PokemonState>('FetchPokemons with PokemonState.pokemonLoaded',
          build: () => pokemonBloc,
          act: (bloc) =>
              bloc.add(const FetchPokemons(handlePage: HandlePage.none)),
          setUp: () {
            when(mockPokemonRepository.fetchPokemons(page: 0))
                .thenAnswer((_) async => Right(pokemonListResponse));

            when(mockPokemonRepository.fetchPokemonDetail(url: anyNamed('url')))
                .thenAnswer((_) async => Right(pokemonDetail));
          },
          expect: () => [
                const PokemonState.pokemonLoading(),
                PokemonState.pokemonLoaded(pokemons: pokemonListResponse)
              ],
          verify: (bloc) {
            verify(mockPokemonRepository.fetchPokemons(page: 0)).called(1);
          });

      blocTest<PokemonBloc, PokemonState>(
        'emits [PokemonLoading, PokemonError] when FetchPokemons is added and repository returns an error',
        build: () => pokemonBloc,
        setUp: () {
          when(mockPokemonRepository.fetchPokemons(page: anyNamed('page')))
              .thenAnswer((_) async => Left(fetchFailure));
          when(mockPokemonRepository.fetchPokemonDetail(url: anyNamed('url')))
              .thenAnswer((_) async => Right(pokemonDetail));
        },
        act: (bloc) => bloc.add(const FetchPokemons(handlePage: HandlePage.none)),
        expect: () => [
          const PokemonState.pokemonLoading(),
          const PokemonState.pokemonError(message: 'Failed to fetch Pokémon'),
        ],
        verify: (bloc) {
          verify(mockPokemonRepository.fetchPokemons(page: anyNamed('page'))).called(1);
          // Aquí no se espera que fetchPokemonDetail sea llamado debido al error en fetchPokemons
        },
      );
    });
  });
}
