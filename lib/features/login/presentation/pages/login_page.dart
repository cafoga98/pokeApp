import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_app/core/presentation/widgets/loading_page.dart';
import 'package:poke_app/core/shared/auto_route/router.dart';
import 'package:poke_app/core/shared/utils/colors_repository.dart';
import 'package:poke_app/core/shared/utils/images_reporitory.dart';
import 'package:poke_app/features/login/domain/bloc/login_bloc/login_bloc.dart';
import 'package:poke_app/features/login/presentation/widgets/footer_login.dart';
import 'package:poke_app/features/login/presentation/widgets/form_login.dart';
import 'package:poke_app/features/pokemon_list/domain/blocs/pokemon_bloc/pokemon_bloc.dart';
import 'package:poke_app/generated/l10n.dart';

///The [LoginPage] class is a stateful widget because it needs to manage the state of the login form.
///The [LoginPage] widget uses a [BlocListener] widget to listen for changes to the state of the [LoginBloc].
///When the [LoginState] is error, the [LoginPage] widget shows an error message to the user.
///When the [LoginState] is loading, the [LoginPage] widget shows a loading dialog to the user.
///And when the [LoginState] is done, the [LoginPage] widget navigates to the next page.
@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRepository.goldenPoppy,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) => state.maybeWhen(orElse: () {
          return null;
        }, error: (e) {
          context.router.popForced();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.message ?? S.current.noData),
            ),
          );
          return null;
        }, loading: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return PopScope(
                canPop: false,
                child: LoadingPage(
                  message: S.current.loadingLogin,
                ),
              );
            },
          );
          return null;
        }, done: (message) {
          context.router.pop().whenComplete(
            () {
              context.read<PokemonBloc>().add(
                const PokemonEvent.fetchPokemons(page: 0),
              );
              context.router.replace(
                const PokemonListRoute(),
              );
            },
          );
          return null;
        }),
        child: SingleChildScrollView(
          //physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200.h,
                    margin: EdgeInsets.only(top: 20.h),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          ImageRepository.pokeLogo,
                        ),
                      ),
                    ),
                  ),
                  const FormLogin(),
                  const FooterLogin(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
