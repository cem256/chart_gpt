import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_model.freezed.dart';
part 'chart_model.g.dart';

@freezed
class ChartModel with _$ChartModel {
  const factory ChartModel({
    required String key,
    required double value,
  }) = _ChartModel;

  factory ChartModel.fromJson(Map<String, dynamic> json) => _$ChartModelFromJson(json);
}
