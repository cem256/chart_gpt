import 'package:chart_gpt/app/errors/failure.dart';
import 'package:chart_gpt/feature/draw_chart/data/api/draw_chart_api.dart';
import 'package:chart_gpt/feature/draw_chart/data/model/chart_model.dart';
import 'package:dartz/dartz.dart';

class DrawChartRepository {
  DrawChartRepository({required DrawChartApi drawChartApi}) : _drawChartApi = drawChartApi;

  final DrawChartApi _drawChartApi;

  Future<Either<Failure, List<ChartModel>>> drawChart({required String message}) async {
    try {
      final response = await _drawChartApi.drawChart(message: message);
      return right(response);
    } catch (_) {
      return left(const Failure());
    }
  }
}
