import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_app/core/shared/auto_route/router.dart';
import 'package:poke_app/core/shared/utils/colors_repository.dart';
import 'package:poke_app/core/shared/utils/style_repository.dart';
import 'package:poke_app/features/pokemon_list/domain/blocs/pokemon_bloc/pokemon_bloc.dart';
import 'package:poke_app/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:poke_app/generated/l10n.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 20.h,
        ),
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Container(
                  height: 100.h,
                  width: MediaQuery.of(context).size.width / 1.3,
                  padding: EdgeInsets.only(
                    top: 8.h,
                    left: 45.w,
                    right: 10.w,
                  ),
                  decoration: const BoxDecoration(
                    color: ColorsRepository.platinum,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pokemon.name,
                        maxLines: 1,
                        style: large.copyWith(
                          color: ColorsRepository.realBlue,
                          height: 1,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        '${S.current.type}: ${pokemon.types != null ? pokemon.types!.map((e) => e.type.name).join(',') : ''}',
                        maxLines: 1,
                        style: medium.copyWith(
                          color: ColorsRepository.realBlue,
                          height: 1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              context.read<PokemonBloc>().add(
                                    PokemonEvent.fetchPokemonDetail(
                                      url: pokemon.url,
                                    ),
                                  );
                              context.router.push(
                                const PokemonDetailsRoute(),
                              );
                            },
                            child: Text(
                              S.current.details,
                              style: small.copyWith(
                                color: ColorsRepository.realBlue,
                                fontWeight: FontWeight.bold,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: 85.h,
              width: 85.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsRepository.realBlue,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 5),
              height: 75.h,
              width: 75.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsRepository.goldenPoppy,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12.h),
              child: Image.network(
                pokemon.imageUrl ?? '',
                height: 86.h,
                width: 86.w,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
