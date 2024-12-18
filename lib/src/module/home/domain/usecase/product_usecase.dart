import 'package:app_flutter_starter_for_job/src/core/error/failures.dart';
import 'package:app_flutter_starter_for_job/src/core/usecase/use_case.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/model/get_product_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/repository/product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProductUseCase extends UseCase<List<GetProductModel>, NoParams> {
  final ProductRepository _productRepository;

  ProductUseCase(this._productRepository);

  @override
  Future<Either<Failure, List<GetProductModel>>> call(NoParams params) => _productRepository.getProduct();
}
