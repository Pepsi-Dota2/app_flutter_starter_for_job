import 'package:app_flutter_starter_for_job/src/core/usecase/use_case.dart';
import 'package:app_flutter_starter_for_job/src/module/profile/domain/usecase/logout_usecase.dart';
import 'package:app_flutter_starter_for_job/src/module/profile/domain/usecase/profile_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUseCase _profileUseCase;
  final LogoutUseCase _logoutUseCase;
  ProfileCubit(this._profileUseCase, this._logoutUseCase)
      : super(ProfileState.initial());

  Future<void> getProfile() async {
    emit(ProfileState.loading());
    final result = await _profileUseCase.call(NoParams());
    result.fold((l) => emit(ProfileState.failure(l.message)), (profile) {
      if (profile?.email == "") {
        emit(ProfileState.empty());
      } else {
        emit(ProfileState.success(profile));
      }
    });
  }

  Future<void> logout() async {
    emit(ProfileState.loading());
    final result = await _logoutUseCase.call(NoParams());
    result.fold(
      (failure) {
        emit(ProfileState.failure(failure.message));
      },
      (_) {
        emit(ProfileState.logoutSuccess());
      },
    );
  }

}
