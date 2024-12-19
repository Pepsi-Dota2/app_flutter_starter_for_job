import 'package:app_flutter_starter_for_job/src/core/error/failures.dart';
import 'package:app_flutter_starter_for_job/src/core/usecase/use_case.dart';
import 'package:app_flutter_starter_for_job/src/module/profile/domain/repository/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class ProfileUseCase implements UseCase<User? , NoParams> {
  final ProfileRepository _profileRepository;

  ProfileUseCase({required ProfileRepository profileRepository}) : _profileRepository = profileRepository;

  @override 
  Future<Either<Failure , User?>> call(NoParams params) => _profileRepository.userProfile();

}