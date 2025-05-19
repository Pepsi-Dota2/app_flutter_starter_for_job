part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.failure(String failure) = _Failure;
  const factory HomeState.error(String message) = _Error;
  const factory HomeState.success({
    @Default([]) List<PosStockItemModel> posStock,
    @Default(1) int currentPage,
    @Default(false) bool hasMorePages,
    @Default(0) int totalItems,
  }) = _Success;
}
