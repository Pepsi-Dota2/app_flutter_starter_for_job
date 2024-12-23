

import 'package:app_flutter_starter_for_job/src/core/error/failures.dart';
import 'package:app_flutter_starter_for_job/src/module/home/data/datasource/remote_datasource.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/model/category_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/repository/category_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository{
  final RemoteDatasource _remoteDatasource;

  CategoryRepositoryImpl({required RemoteDatasource remoteDatasource}) : _remoteDatasource = remoteDatasource;
  @override

  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    final response = await _remoteDatasource.getCategories();
    return response.fold(
      (failure) => Left(failure),
      (res) => Right(res),
    );
  }
}