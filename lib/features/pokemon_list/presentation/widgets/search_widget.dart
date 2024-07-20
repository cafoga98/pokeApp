import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_app/core/shared/utils/colors_repository.dart';
import 'package:poke_app/core/shared/utils/style_repository.dart';
import 'package:poke_app/features/pokemon_list/domain/blocs/pokemon_bloc/pokemon_bloc.dart';
import 'package:poke_app/generated/l10n.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: TextFormField(
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.name,
          style: medium.copyWith(color: ColorsRepository.realBlue),
          decoration: inputTextFormField.copyWith(
            hintText: S.current.searchByName,
            suffixIcon: IconButton(
              onPressed: () {
                _formKey.currentState!.save();
              },
              icon: Icon(
                Icons.search,
                size: 23.w,
              ),
            ),
          ),
          onFieldSubmitted: (name) {
            _submitted(name, context);
          },
          onSaved: (name) {
            _submitted(name, context);
          },
        ),
      ),
    );
  }

  _submitted(String? name, BuildContext context) {
    if (name!.isNotEmpty) {
      context.read<PokemonBloc>().add(
            PokemonEvent.searchPokemons(name: name!),
          );
    } else {
      context.read<PokemonBloc>().add(
            const PokemonEvent.fetchPokemons(handlePage: HandlePage.none),
          );
    }
  }
}
