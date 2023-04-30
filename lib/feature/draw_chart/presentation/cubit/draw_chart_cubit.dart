import 'package:chart_gpt/app/enums/page_status.dart';
import 'package:chart_gpt/feature/draw_chart/data/model/chart_model.dart';
import 'package:chart_gpt/feature/draw_chart/data/repository/draw_chart_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'draw_chart_cubit.freezed.dart';
part 'draw_chart_state.dart';

class DrawChartCubit extends Cubit<DrawChartState> {
  DrawChartCubit({required DrawChartRepository drawChartRepository})
      : _drawChartRepository = drawChartRepository,
        super(const DrawChartState());

  final DrawChartRepository _drawChartRepository;

  Future<void> drawChart({required String? message}) async {
    if (message == null || message.trim().isEmpty) {
      emit(state.copyWith(isValidInput: false));
    } else {
      emit(state.copyWith(isValidInput: true, status: PageStatus.loading));
      final response = await _drawChartRepository.drawChart(message: message);

      response.fold(
        (failure) => emit(state.copyWith(status: PageStatus.failure)),
        (success) => emit(
          state.copyWith(status: PageStatus.success, chartData: success),
        ),
      );
    }
  }

  void selectedIndexChanged({required int index}) {
    emit(state.copyWith(selectedIndex: index));
  }

  void validateUserInput({required String message}) {
    if (message.trim().isEmpty) {
      emit(state.copyWith(isValidInput: false));
    } else {
      emit(state.copyWith(isValidInput: true));
    }
  }
}
