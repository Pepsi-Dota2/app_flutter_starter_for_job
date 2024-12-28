import 'package:app_flutter_starter_for_job/src/module/login/domain/repository/register_repository.dart';
import 'package:app_flutter_starter_for_job/src/module/login/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/use_case.dart';

part 'register_usecase.freezed.dart';
part 'register_usecase.g.dart';

@lazySingleton
class RegisterUseCase extends UseCase<UserCredential, RegisterParams> {
  final RegisterRepository _repo;

  RegisterUseCase(this._repo);

  @override
  Future<Either<Failure, UserCredential>> call(RegisterParams params) =>
      _repo.userRegister(params);
}

@freezed
class RegisterParams with _$RegisterParams {
  const factory RegisterParams({
    @Default("") String username,
    @Default("") String email,
    @Default("") String password,
    @Default("") String phoneVerificationId,
    @Default("") String smsCode,
  }) = _RegisterParams;
  factory RegisterParams.fromJson(Map<String, dynamic> json) =>
      _$RegisterParamsFromJson(json);
}
