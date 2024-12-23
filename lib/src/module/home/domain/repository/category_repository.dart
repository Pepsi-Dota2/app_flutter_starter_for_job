

import 'package:app_flutter_starter_for_job/src/core/error/failures.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/model/category_model.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepository {
  Future<Either<Failure , List<CategoryModel>>> getCategories();
}