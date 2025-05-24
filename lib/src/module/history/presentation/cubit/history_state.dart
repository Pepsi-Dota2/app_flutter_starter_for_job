part of 'history_cubit.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState.initial() = _Initial;
  const factory HistoryState.loading() = _Loading;
  const factory HistoryState.error(String message) = _Error;
  const factory HistoryState.success({
    required HistoryModel docno,
  }) = _Success;
  const factory HistoryState.failure(String failure) = _Failure;
}
