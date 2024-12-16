part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.error() = _Error;
  const factory LoginState.success(UserCredential user) = _Success;
  const factory LoginState.failure(String failure) = _Failure;
}
