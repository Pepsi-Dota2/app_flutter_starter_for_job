import 'package:app_flutter_starter_for_job/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

abstract class ProfileRemoteDatasource {
  Future<Either<Failure, User?>> userProfile();
  Future<Either<Failure, User?>> userLogout();
}

@LazySingleton(as: ProfileRemoteDatasource)
class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  final FirebaseAuth _firebaseAuth;

  ProfileRemoteDatasourceImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<Either<Failure, User?>> userProfile() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        return Right(user);
      } else {
        return Left(ServerFailure("No authenticated user not found"));
      }
    } on PlatformException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User?>> userLogout() async {
    try {
      await _firebaseAuth.signOut();
      return const Right(null);
    } on PlatformException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
