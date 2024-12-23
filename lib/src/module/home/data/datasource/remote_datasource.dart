import 'package:app_flutter_starter_for_job/src/core/error/failures.dart';
import 'package:app_flutter_starter_for_job/src/core/service/api_service.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/model/category_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/model/get_product_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/model/product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

abstract class RemoteDatasource {
  Future<Either<Failure, List<GetProductModel>>> getProduct();
  Future<Either<Failure, List<CategoryModel>>> getCategories();
  Future<Either<Failure, List<GetProductionModel>>> getAllProduct();
}

@LazySingleton(as: RemoteDatasource)
class ProductRemoteDatasource implements RemoteDatasource {
  final AppApi _appApi;

  ProductRemoteDatasource(this._appApi);

  @override
  Future<Either<Failure, List<GetProductModel>>> getProduct() async {
    try {
      final response = await _appApi.getProduct();
      return Right(response);
    } on PlatformException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      final response = await _appApi.getCategory();
      return Right(response);
    } on PlatformException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GetProductionModel>>> getAllProduct() async {
    try {
      final response = await _appApi.getAllProduct();
      return Right(response);
    } on PlatformException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
