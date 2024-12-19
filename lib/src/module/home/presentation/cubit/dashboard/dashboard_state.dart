part of 'dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(DataStatus.initial) DataStatus status,
    @Default(0) int index,
    @Default(BottomItem.home) BottomItem navbarItem,
    @Default(false) bool onClick,
  })= _DashboardState;
}
