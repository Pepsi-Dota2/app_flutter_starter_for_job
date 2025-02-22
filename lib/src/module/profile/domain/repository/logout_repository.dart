import 'package:app_flutter_starter_for_job/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LogoutRepository {
  Future<Either<Failure , User?>> userLogout();
}