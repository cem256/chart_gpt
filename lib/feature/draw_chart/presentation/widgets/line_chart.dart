import 'package:chart_gpt/core/extensions/context_extensions.dart';
import 'package:chart_gpt/feature/draw_chart/data/model/chart_model.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatelessWidget {
  const LineChart({required this.chartData, super.key});

  final List<ChartModel> chartData;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      series: [
        LineSeries<ChartModel, String>(
          dataSource: chartData,
          color: context.theme.colorScheme.primaryContainer,
          xValueMapper: (ChartModel data, _) => data.key,
          yValueMapper: (ChartModel data, _) => data.value,
        )
      ],
    );
  }
}
