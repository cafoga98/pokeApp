part of 'pokemon_bloc.dart';

@freezed
class PokemonEvent with _$PokemonEvent {
  const factory PokemonEvent.started() = Started;
  const factory PokemonEvent.fetchPokemons({required int page}) = FetchPokemons;
  const factory PokemonEvent.fetchPokemonDetail({required String url}) = FetchPokemonDetail;
}
