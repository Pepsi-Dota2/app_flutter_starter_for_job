part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = _Loading;
  const factory CartState.success({
    @Default([]) List<PosStockItemModel> items,
    @Default(1) int quantity,
  }) = _Success;
  const factory CartState.error(String message) = _Error;
}
