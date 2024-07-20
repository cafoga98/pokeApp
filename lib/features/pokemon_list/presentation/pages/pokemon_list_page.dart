import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/core/shared/utils/colors_repository.dart';
import 'package:poke_app/core/shared/utils/style_repository.dart';
import 'package:poke_app/features/pokemon_list/domain/blocs/pokemon_bloc/pokemon_bloc.dart';
import 'package:poke_app/features/pokemon_list/presentation/widgets/pokemon_card.dart';

@RoutePage()
class PokemonListPage extends StatelessWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRepository.realBlue,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsRepository.realBlue,
        onPressed: () {
          context.read<PokemonBloc>().add(
                const PokemonEvent.fetchPokemons(page: 0),
              );
        },
        child: const Icon(
          Icons.refresh,
          color: ColorsRepository.platinum,
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Pokemon List',
          style: extraLarge,
        ),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) => state.maybeWhen(
          orElse: () {
            return Container();
          },
          pokemonLoading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          pokemonLoaded: (pokemonList) {
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: pokemonList.length,
              itemBuilder: (context, index) {
                return PokemonCard(
                  pokemon: pokemonList[index],
                );
              },
            );
          },
          pokemonError: (e) {
            return Center(
              child: Text(e),
            );
          },
        ),
      ),
    );
  }
}
