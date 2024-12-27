import 'package:app_flutter_starter_for_job/src/core/usecase/use_case.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/model/filter_product_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/repository/filter_product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';

part 'filter_product_usecase.g.dart';
part 'filter_product_usecase.freezed.dart';

@lazySingleton
class FilterProductUseCase
    extends UseCase<List<FilterProductModel>, FilterParams> {
  final FilterProductRepository filterProductRepository;
  FilterProductUseCase(this.filterProductRepository);
  @override
  Future<Either<Failure, List<FilterProductModel>>> call(FilterParams params) =>
      filterProductRepository.filterProduct(title: params.title);
}

@freezed
class FilterParams with _$FilterParams {
  const factory FilterParams({@Default("") String title}) = _FilterParams;
  factory FilterParams.fromJson(Map<String, dynamic> json) =>
      _$FilterParamsFromJson(json);
}
