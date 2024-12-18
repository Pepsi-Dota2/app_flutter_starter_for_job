import 'package:app_flutter_starter_for_job/src/core/error/failures.dart';
import 'package:app_flutter_starter_for_job/src/core/service/api_service.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/model/get_product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

abstract class RemoteDatasource {
  Future<Either<Failure, List<GetProductModel>>> getProduct();
}

@LazySingleton(as: RemoteDatasource)
class ProductRemoteDatasource implements RemoteDatasource {
  final AppApi _appApi;

  ProductRemoteDatasource(this._appApi);

  @override
  Future<Either<Failure, List<GetProductModel>>> getProduct() async {
    try {
      final response = await _appApi.getProduct();
      print("#######################${response}");
      return Right(response);
    } on PlatformException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
