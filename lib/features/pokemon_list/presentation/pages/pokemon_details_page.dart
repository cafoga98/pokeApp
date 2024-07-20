import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_app/core/shared/utils/colors_repository.dart';
import 'package:poke_app/core/shared/utils/images_reporitory.dart';
import 'package:poke_app/core/shared/utils/style_repository.dart';
import 'package:poke_app/features/pokemon_list/domain/blocs/pokemon_bloc/pokemon_bloc.dart';
import 'package:poke_app/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRepository.limeGreen,
      appBar: AppBar(
        backgroundColor: ColorsRepository.limeGreen,
        title: Text(
          S.current.pokemonDetails,
        ),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        buildWhen: (context, state) => state.maybeWhen(
          orElse: () => false,
          pokemonDetailLoaded: (d) => true,
          pokemonDetailLoading: () => true,
          pokemonDetailError: (e) => true,
        ),
        builder: (context, state) => state.maybeWhen(
          orElse: () {
            return Container();
          },
          pokemonDetailLoading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          pokemonDetailLoaded: (pokemon) {
            return Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        ImageRepository.pokemonGarden,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Image.network(
                      pokemon.sprites.frontDefault,
                      fit: BoxFit.contain,
                      height: 130.h,
                    ),
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pokemon.name,
                            style: extraLarge,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            '${S.current.height}: ${pokemon.height}',
                            style: small.copyWith(color: Colors.white),
                          ),
                          Text(
                            '${S.current.types}: ${pokemon.types.map((type) => type.type.name).join(', ')}',
                            style: small.copyWith(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            '${S.current.moves}: ${pokemon.moves.map((move) => move.move.name).join(', ')}',
                            style: small.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    )),
                TextButton(
                  onPressed: () => launchUrl(
                    Uri.parse(pokemon.forms.first.url),
                  ),
                  child: Text(
                    S.current.viewJson,
                    style: medium,
                  ),
                ),
              ],
            );
          },
          pokemonDetailError: (e) {
            return Center(
              child: Text(e),
            );
          },
        ),
      ),
    );
  }
}
