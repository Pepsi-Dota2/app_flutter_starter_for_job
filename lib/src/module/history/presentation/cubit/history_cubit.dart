import 'package:app_flutter_starter_for_job/src/core/service/api_service.dart';
import 'package:app_flutter_starter_for_job/src/module/history/model/history_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_state.dart';
part 'history_cubit.freezed.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(this.appApi) : super(HistoryState.initial());
  final AppApi appApi;
  Future<void> getHistory() async {
    emit(HistoryState.loading());
    try {
      final response = await appApi.getHistory();
      emit(HistoryState.success(docno: response));
    } catch (e) {
      emit(HistoryState.failure(e.toString()));
    }
  }
}
