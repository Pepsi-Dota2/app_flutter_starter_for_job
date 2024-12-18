import 'package:app_flutter_starter_for_job/src/core/usecase/use_case.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/model/get_product_model.dart';
import 'package:app_flutter_starter_for_job/src/module/home/domain/usecase/product_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductUseCase _productUseCase;
  HomeCubit(this._productUseCase) : super(HomeState.initial());

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
            emit(HomeState.success(product));
          }
        },
      );
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
  }
}
