import 'package:app_flutter_starter_for_job/src/core/error/failures.dart';
import 'package:app_flutter_starter_for_job/src/core/usecase/use_case.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/model/category_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/repository/category_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CategoryUseCase extends UseCase<List<CategoryModel> , NoParams> {
  final CategoryRepository _categoryRepository;

  CategoryUseCase(this._categoryRepository);

  @override
  Future<Either<Failure, List<CategoryModel>>> call(NoParams params) => _categoryRepository.getCategories();
  
}