part of 'pokemon_bloc.dart';

enum HandlePage {next, back, none}
@freezed
class PokemonEvent with _$PokemonEvent {
  const factory PokemonEvent.started() = Started;
  const factory PokemonEvent.fetchPokemons({required HandlePage handlePage}) = FetchPokemons;
  const factory PokemonEvent.fetchPokemonDetail({required String url}) = FetchPokemonDetail;
}
