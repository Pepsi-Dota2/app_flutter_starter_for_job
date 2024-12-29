

import 'package:app_flutter_starter_for_job/src/core/error/failures.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/model/product_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/usecase/get_all_product_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class GetAllProductRepository {
  Future<Either<Failure , List<GetProductionModel>>> getAllProduct(Pagination pagination);
}