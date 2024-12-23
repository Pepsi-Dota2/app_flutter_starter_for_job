

import 'package:app_flutter_starter_for_job/src/module/home/data/datasource/remote_datasource.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/model/product_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/repository/all_product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';

@LazySingleton(as: GetAllProductRepository)
class GetAllProductRepositoryImpl implements GetAllProductRepository {
  final RemoteDatasource _remoteDatasource;

  GetAllProductRepositoryImpl({required RemoteDatasource remoteDatasource}) : _remoteDatasource = remoteDatasource;

  @override
  Future<Either<Failure , List<GetProductionModel>>> getAllProduct() async {
    final respose = await _remoteDatasource.getAllProduct();
    return respose.fold(
      (failure) => Left(failure),
      (res) => Right(res),
    );
  }
}