import 'package:app_flutter_starter_for_job/src/core/error/failures.dart';
import 'package:app_flutter_starter_for_job/src/module/profile/data/datasource/profile_remote_datasource.dart';
import 'package:app_flutter_starter_for_job/src/module/profile/domain/repository/logout_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LogoutRepository)
class LogoutRepositoryImpl implements LogoutRepository {
  final ProfileRemoteDatasource _profileRemoteDatasource;

  LogoutRepositoryImpl({required ProfileRemoteDatasource profileRemoteDatasource}): _profileRemoteDatasource = profileRemoteDatasource;

  @override
  Future<Either<Failure, User?>> userLogout() async {
    final response = await _profileRemoteDatasource.userLogout();
    return response.fold(
      (failure) => left(failure),
      (userLogout) => right(userLogout),
    );
  }
}
