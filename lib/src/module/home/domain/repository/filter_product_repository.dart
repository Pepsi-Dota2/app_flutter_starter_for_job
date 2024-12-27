

import 'package:app_flutter_starter_for_job/src/core/error/failures.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/model/filter_product_model.dart';
import 'package:dartz/dartz.dart';

abstract class FilterProductRepository {
  Future<Either<Failure , List<FilterProductModel>>> filterProduct({
    required String title
  });
}