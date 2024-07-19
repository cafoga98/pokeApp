part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.done({required String message}) = _Done;
  const factory LoginState.error({required Failure failure}) = _Error;
  const factory LoginState.loading() = _Loading;
}
