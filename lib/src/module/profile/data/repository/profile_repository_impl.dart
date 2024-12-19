import 'package:app_flutter_starter_for_job/src/core/error/failures.dart';
import 'package:app_flutter_starter_for_job/src/module/profile/data/datasource/profile_remote_datasource.dart';
import 'package:app_flutter_starter_for_job/src/module/profile/domain/repository/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDatasource _profileRemoteDatasource;

  ProfileRepositoryImpl({required ProfileRemoteDatasource profileRemoteDatasource}) : _profileRemoteDatasource = profileRemoteDatasource;

  @override
  Future<Either<Failure, User?>> userProfile() async {
    final response = await _profileRemoteDatasource.userProfile();
    return response.fold(
      (failure) => Left(failure),
      (user) => Right(user),
    );
  }
}
