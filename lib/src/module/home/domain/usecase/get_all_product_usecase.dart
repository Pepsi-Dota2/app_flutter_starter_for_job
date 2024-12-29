

import 'package:app_flutter_starter_for_job/src/core/usecase/use_case.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/model/product_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/repository/all_product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';

@lazySingleton
class GetAllProductUseCase extends UseCase<List<GetProductionModel> , Pagination> {
  final GetAllProductRepository _getAllProductRepository;
  GetAllProductUseCase(this._getAllProductRepository);

  @override
  Future<Either<Failure , List<GetProductionModel>>> call(Pagination pagination) => _getAllProductRepository.getAllProduct(pagination);
}

class Pagination {
  final int limit;
  final int offset;
  Pagination({required this.limit, required this.offset});  
}