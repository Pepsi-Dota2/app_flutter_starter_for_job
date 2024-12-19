import 'package:app_flutter_starter_for_job/src/core/enum/enum.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState());
   void getNavBarItem(BottomItem item) {
    int newIndex;
    switch (item) {
      case BottomItem.home:
        newIndex = 0;
        break;
      case BottomItem.profile:
        newIndex = 1;
        break;
    }
    emit(state.copyWith(navbarItem: item, index: newIndex));
  }

}
