import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_app/core/shared/utils/colors_repository.dart';
import 'package:poke_app/features/pokemon_list/domain/blocs/pokemon_bloc/pokemon_bloc.dart';
import 'package:poke_app/features/pokemon_list/presentation/widgets/pokemon_card.dart';
import 'package:poke_app/generated/l10n.dart';

@RoutePage()
class PokemonListPage extends StatelessWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRepository.realBlue,
      floatingActionButton: Container(
        width: 100.w,
        decoration: BoxDecoration(
          color: ColorsRepository.realBlue,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorsRepository.goldenPoppy,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                context.read<PokemonBloc>().add(
                      const PokemonEvent.fetchPokemons(
                        handlePage: HandlePage.back,
                      ),
                    );
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ColorsRepository.platinum,
              ),
            ),
            IconButton(
              onPressed: () {
                context.read<PokemonBloc>().add(
                      const PokemonEvent.fetchPokemons(
                        handlePage: HandlePage.next,
                      ),
                    );
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: ColorsRepository.platinum,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          S.current.pokemonList,
        ),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        buildWhen: (context, state) => state.maybeWhen(
          orElse: () => true,
          pokemonDetailLoaded: (d) => false,
          pokemonDetailLoading: () => false,
          pokemonDetailError: (e) => false,
        ),
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
            if (pokemonList.isNotEmpty) {
              return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: pokemonList.length,
                itemBuilder: (context, index) {
                  return PokemonCard(
                    pokemon: pokemonList[index],
                  );
                },
              );
            } else {
              return Center(
                child: Text(S.current.noData),
              );
            }
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
