

// import 'package:app_flutter_starter_for_job/src/core/error/failures.dart';
// import 'package:app_flutter_starter_for_job/src/module/home/data/datasource/remote_datasource.dart';
// import 'package:app_flutter_starter_for_job/src/module/home/domain/model/filter_product_model.dart';
// import 'package:app_flutter_starter_for_job/src/module/home/domain/repository/filter_product_repository.dart';
// import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';

// @LazySingleton(as: FilterProductRepository)
// class FilterProductRepositoryImpl implements FilterProductRepository {
//   final RemoteDatasource _remoteDatasource;
//   FilterProductRepositoryImpl({required RemoteDatasource remoteDatasource}) : _remoteDatasource = remoteDatasource;

//   @override
//   Future<Either<Failure , List<FilterProductModel>>> filterProduct({required String title}) async {
//     final response = await _remoteDatasource.filterProduct(title: title);
//     return response.fold(
//       (failure) => Left(failure),
//       (res) => Right(res),
//     );    
//   }
// }