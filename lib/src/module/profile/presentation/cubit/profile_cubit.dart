import 'package:app_flutter_starter_for_job/src/core/usecase/use_case.dart';
import 'package:app_flutter_starter_for_job/src/module/profile/domain/usecase/profile_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUseCase _profileUsecase;
  ProfileCubit(this._profileUsecase) : super(ProfileState.initial());

  Future<void> getProfile() async {
    emit(ProfileState.loading());
    final result = await _profileUsecase.call(NoParams());
    result.fold((l) => emit(ProfileState.failure(l.message)), (profile) {
      if (profile?.email == "") {
        emit(ProfileState.empty());
      } else {
        emit(ProfileState.success(profile));
      }
    });
  }
}
