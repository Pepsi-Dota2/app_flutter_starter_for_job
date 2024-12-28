import 'package:app_flutter_starter_for_job/src/core/error/failures.dart';
import 'package:app_flutter_starter_for_job/src/module/login/data/datasource/login_local_datasource.dart';
import 'package:app_flutter_starter_for_job/src/module/login/data/datasource/remote_login_datasource.dart';
import 'package:app_flutter_starter_for_job/src/module/login/domain/repository/register_repository.dart';
import 'package:app_flutter_starter_for_job/src/module/login/domain/usecase/register_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as:  RegisterRepository)
class RegisterRepositoryImpl implements RegisterRepository {
  final LoginRemoteDatasource _loginRemoteDatasource;
  final LoginLocalDatasource _loginLocalDatasource;

  RegisterRepositoryImpl(this._loginLocalDatasource, {required LoginRemoteDatasource loginRemoteDatasource}) : _loginRemoteDatasource = loginRemoteDatasource;
  @override
  Future<Either<Failure, User>> userRegister(RegisterParams params) async {
    final response = await _loginRemoteDatasource.userRegister(params);
    return response.fold(
      (failure) => Left(failure),
      (res) async {
        await _loginLocalDatasource.saveUser(uid: res.uid);
        return Right(res);
      },
    );
  }
}
