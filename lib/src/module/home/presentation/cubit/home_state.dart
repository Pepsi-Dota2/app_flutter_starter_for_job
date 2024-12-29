part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.error(String message) = _Error;
  const factory HomeState.success({
    @Default([]) List<GetProductModel> data,
    @Default([]) List<CategoryModel> categoryData,
    @Default([]) List<GetProductionModel> getAllProduction,
    @Default("") String? selectedPaymentMethod,
    @Default("") String? selectedBank,
    @Default(true) bool hasMoreData,
  }) = _Success;
}
