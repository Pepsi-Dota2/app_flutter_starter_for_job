import 'package:app_flutter_starter_for_job/src/core/error/failures.dart';
import 'package:app_flutter_starter_for_job/src/module/login/domain/usecase/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

abstract class LoginRemoteDatasource {
  Future<Either<Failure, UserCredential>> userLogin(LoginParams params);
}

@LazySingleton(as: LoginRemoteDatasource)
class RemoteLoginDatasource implements LoginRemoteDatasource {
  final FirebaseAuth _firebaseAuth;

  RemoteLoginDatasource(this._firebaseAuth);
  @override
  Future<Either<Failure, UserCredential>> userLogin(LoginParams params) async {
    try {
      final user = await _firebaseAuth.signInWithEmailAndPassword(email: params.email, password: params.password);
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
