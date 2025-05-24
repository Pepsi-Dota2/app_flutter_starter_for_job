part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.failure(String failure) = _Failure;
  const factory HomeState.error(String message) = _Error;
  const factory HomeState.success({
    @Default([]) List<PosStockItemModel> posStock,
    PosStockItemModel? posStockDetail,
    @Default(1) int currentPage,
    @Default(false) bool hasMorePages,
  }) = _Success;
  const factory HomeState.loadMore({
    @Default([]) List<PosStockItemModel> posStock,
    @Default(1) int currentPage,
    @Default(false) bool hasMorePages,
  }) = _LoadMore;
}
