import 'package:app_flutter_starter_for_job/src/core/error/failures.dart';
import 'package:app_flutter_starter_for_job/src/module/home/data/datasource/local_datasource.dart';
import 'package:app_flutter_starter_for_job/src/module/home/data/datasource/remote_datasource.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/model/get_product_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/repository/product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRepository)
class ProductionRepositoryImpl implements ProductRepository {
  final RemoteDatasource _remoteDatasource;
  final LocalDatasource _localDatasource;

  ProductionRepositoryImpl(this._localDatasource,
      {required RemoteDatasource remoteDatasource})
      : _remoteDatasource = remoteDatasource;

  @override
  Future<Either<Failure, List<GetProductModel>>> getProduct() async {
    final response = await _remoteDatasource.getProduct();
    return response.fold(
      (failure) => Left(failure),
      (res) => Right(res),
    );
  }
}
