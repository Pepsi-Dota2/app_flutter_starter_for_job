import 'package:app_flutter_starter_for_job/src/core/error/failures.dart';
import 'package:app_flutter_starter_for_job/src/core/model/auth_model.dart';
import 'package:app_flutter_starter_for_job/src/core/service/api_service.dart';
import 'package:app_flutter_starter_for_job/src/module/login/domain/usecase/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

abstract class LoginRemoteDatasource {
  Future<Either<Failure, AuthModel>> userLogin(LoginParams params);
}

@LazySingleton(as: LoginRemoteDatasource)
class RemoteLoginDatasource implements LoginRemoteDatasource {
  final AppApi _authLogin;

  RemoteLoginDatasource(this._authLogin);
  @override
  Future<Either<Failure, AuthModel>> userLogin(LoginParams params) async {
    try {
      final user = await _authLogin.login({"username": params.username, "password": params.password});
      return Right(user);
    } on PlatformException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
