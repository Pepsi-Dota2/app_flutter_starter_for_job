import 'package:app_flutter_starter_for_job/src/core/usecase/use_case.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/model/category_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/model/get_product_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/model/product_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/usecase/category_usecase.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/usecase/get_all_product_usecase.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/usecase/product_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductUseCase _productUseCase;
  final CategoryUsecase _categoryUsecase;
  final GetAllProductUseCase _getAllProductUseCase;
  HomeCubit(this._productUseCase, this._categoryUsecase, this._getAllProductUseCase) : super(HomeState.initial());

  Future<void> getPhotos() async {
    emit(HomeState.loading());
    try {
      final result = await _productUseCase.call(NoParams());
      result.fold(
        (error) => emit(HomeState.error(error.message)),
        (product) {
          if (product.isEmpty) {
            emit(const HomeState.error('No data available'));
          } else {
            emit(HomeState.success(data: product , categoryData: []));
          }
        },
      );
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
  }

  Future<void> getCategories() async {
    emit(HomeState.loading());
    try {
      final result = await _categoryUsecase.call(NoParams());
      result.fold(
        (error) => emit(HomeState.error(error.message)),
        (category) {
          if (category.isEmpty) {
            emit(const HomeState.error('No data available'));
          } else {
            emit(HomeState.success(categoryData: category , data: []));
          }
        },
      );
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
  }

  Future<void> getAllProduct() async{
    emit(HomeState.loading());
    try {
      final result = await _getAllProductUseCase.call(NoParams());
      result.fold(
        (error) => emit(HomeState.error(error.message)),
        (getAllProduct) {
          if (getAllProduct.isEmpty) {
            emit(const HomeState.error('No data available'));
          } else {
            emit(HomeState.success(data: [] , categoryData: [] , getAllProduction: getAllProduct));
          }
        },
      );
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
  }
}
