import 'package:app_flutter_starter_for_job/src/core/constants/api_path/api_path.dart';
import 'package:app_flutter_starter_for_job/src/module/home/model/code_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  Future<CodeModel?> loginUser(String username, String password) async {
    final dio = Dio();
    emit(LoginState.loading());

    try {
      emit(LoginState.loading());
      final response = await dio.post(
        ApiPath.authLogin,
        data: {
          'username': username,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        final data = response.data;
        final codeModel = CodeModel.fromJson(data);
        emit(LoginState.success(codeModel));
      } else {
        emit(LoginState.failure('Login failed: ${response.statusCode}'));
      }
    } catch (e) {
      emit(LoginState.failure('Login failed: $e'));
    }
  }
}
