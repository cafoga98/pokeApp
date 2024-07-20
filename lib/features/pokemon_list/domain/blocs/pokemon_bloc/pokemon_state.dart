part of 'pokemon_bloc.dart';

@freezed
class PokemonState with _$PokemonState {
  const factory PokemonState.pokemonInitial() = _PokemonInitial;
  const factory PokemonState.pokemonLoading() = _PokemonLoading;
  const factory PokemonState.pokemonLoaded({required List<Pokemon> pokemons}) = _PokemonLoaded;
  const factory PokemonState.pokemonError({required String message}) = _PokemonError;
  const factory PokemonState.pokemonDetailLoaded({required PokemonDetail pokemonDetail}) = _PokemonDetailLoaded;
  const factory PokemonState.pokemonDetailLoading() = _PokemonDetailLoading;
  const factory PokemonState.pokemonDetailError({required String message}) = _PokemonDetailError;
}
