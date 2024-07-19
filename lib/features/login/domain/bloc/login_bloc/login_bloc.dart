import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_app/core/data/repository/implementation/local_storage_repository.dart';
import 'package:poke_app/features/login/domain/entities/user.dart';
import 'package:poke_app/generated/l10n.dart';

import '/core/shared/error_handle/failure.dart';

part 'login_event.dart';

part 'login_state.dart';

part 'login_bloc.freezed.dart';

/// A bloc that manages the login state of an app.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LocalStorageRepository localStorageRepository;

  /// Creates a new LoginBloc instance.
  LoginBloc({
    required this.localStorageRepository,
  }) : super(const LoginState.initial()) {
    on<LoginEvent>(_fetchLogin);
  }

  /// Fetches the login state from the login repository.
  void _fetchLogin(LoginEvent event, Emitter<LoginState> emit) async {
    /// Emit a loading state to indicate that the login process is in progress.
    emit(const LoginState.loading());

    /// Wait for 2 seconds to simulate a network request.
    await Future.delayed(const Duration(seconds: 2));

    /// Call the login repository to login the user.
    final response = await localStorageRepository.makeLoginFake(
      user: User(
        password: event.password,
        username: event.userName!,
      ),
    );

    /// Emit the appropriate state depending on the response from the login repository.
    emit(
      response.fold(
        (left) {
          return LoginState.error(failure: left);
        },
        (right) {
          if (right) {
            return LoginState.done(message: S.current.login);
          } else {
            return LoginState.error(
              failure: Failure.serverFailure(
                message: S.current.wrongCredentials,
              ),
            );
          }
        },
      ),
    );
  }
}
