import 'package:app_flutter_starter_for_job/src/core/model/auth_model.dart';
import 'package:app_flutter_starter_for_job/src/module/login/domain/usecase/login_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  LoginCubit(
    this._loginUseCase,
  ) : super(LoginState.initial());

  Future<void> userLogin({required String username, required String password}) async {
    emit(LoginState.loading());
    final result =
        await _loginUseCase(LoginParams(username: username, password: password));
    result.fold(
      (failure) => emit(LoginState.failure(failure.message)),
      (user) => emit(LoginState.success(user)),
    );
  }
}
