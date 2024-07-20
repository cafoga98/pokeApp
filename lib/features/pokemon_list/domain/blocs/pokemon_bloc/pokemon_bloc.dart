import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_app/features/pokemon_list/data/repositories/implementation/pokemon_repository.dart';
import 'package:poke_app/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:poke_app/features/pokemon_list/domain/entities/pokemon_detail.dart';

part 'pokemon_event.dart';

part 'pokemon_state.dart';

part 'pokemon_bloc.freezed.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository pokemonRepository;

  PokemonBloc({required this.pokemonRepository})
      : super(const PokemonState.pokemonInitial()) {
    on<FetchPokemons>(_fetchPokemons);
    on<FetchPokemonDetail>(_fetchPokemonDetail);
    on<SearchPokemons>(_searchPokemons);
  }

  int _page = 0;

  void _fetchPokemons(FetchPokemons event, Emitter<PokemonState> emit) async {
    emit(const PokemonState.pokemonLoading());
    if (event.handlePage == HandlePage.next) {
      _page = _page + 20;
    } else if (event.handlePage == HandlePage.back && _page != 0) {
      _page = _page - 20;
    }
    final pokemons = await pokemonRepository.fetchPokemons(page: _page);
    emit(
      await pokemons.fold(
        (l) => PokemonState.pokemonError(message: l.message!),
        (pokemonList) async {
          final pokemonsTypes = await getPokemonType(pokemonList: pokemonList);
          return PokemonState.pokemonLoaded(pokemons: pokemonsTypes);
        },
      ),
    );
  }

  Future<List<Pokemon>> getPokemonType(
      {required List<Pokemon> pokemonList}) async {
    final List<Pokemon> pokemons = [];

    for (var pokemon in pokemonList) {
      final response =
          await pokemonRepository.fetchPokemonDetail(url: pokemon.url);
      response.fold(
        (l) => null,
        (r) {
          pokemon.types?.addAll(r.types);
          pokemons.add(pokemon);
        },
      );
    }

    return pokemons;
  }

  void _fetchPokemonDetail(
      FetchPokemonDetail event, Emitter<PokemonState> emit) async {
    emit(const PokemonState.pokemonDetailLoading());
    final pokemon = await pokemonRepository.fetchPokemonDetail(url: event.url);
    emit(
      pokemon.fold(
        (l) => PokemonState.pokemonDetailError(message: l.message!),
        (pokemonDetail) =>
            PokemonState.pokemonDetailLoaded(pokemonDetail: pokemonDetail),
      ),
    );
  }

  void _searchPokemons(SearchPokemons event, Emitter<PokemonState> emit) async {
    emit(const PokemonState.pokemonLoading());
    final pokemons = await pokemonRepository.searchPokemon(name: event.name);
    emit(
      pokemons.fold(
            (l) => PokemonState.pokemonError(message: l.message!),
            (pokemonList) => PokemonState.pokemonLoaded(pokemons: pokemonList),
      ),
    );
  }
}
