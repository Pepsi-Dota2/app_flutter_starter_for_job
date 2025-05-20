part of 'customer_cubit.dart';

@freezed
class CustomerState with _$CustomerState {
  const factory CustomerState.initial() = _Initial;
  const factory CustomerState.loading() = _Loading;
  const factory CustomerState.failure(String failure) = _Failure;
  const factory CustomerState.error(String message) = _Error;
  const factory CustomerState.success({
    @Default([]) List<CustomerModel> customer,
  }) = _Success;
}
