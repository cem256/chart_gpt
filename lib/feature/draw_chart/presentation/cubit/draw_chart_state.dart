part of 'draw_chart_cubit.dart';

@freezed
class DrawChartState with _$DrawChartState {
  const factory DrawChartState({
    @Default(PageStatus.initial) PageStatus status,
    @Default([]) List<ChartModel> chartData,
    @Default(0) int selectedIndex,
    @Default(true) bool isValidInput,
  }) = _DrawChartState;
}
