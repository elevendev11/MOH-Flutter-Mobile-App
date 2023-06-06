import 'package:json_annotation/json_annotation.dart';
import 'package:sa_cooperation/models/date_time_epoch_converter.dart';
part 'success_index_line_chart.g.dart';

@JsonSerializable()
@DateTimeEpochConverter()
class SuccessIndexLineChart {
  final int id;
  final int userId;
  final DateTime createdAt;
  final double sliderValueAverage;

  SuccessIndexLineChart({
    required this.createdAt,
    required this.sliderValueAverage,
    required this.id,
    required this.userId,
  });

  factory SuccessIndexLineChart.fromJson(Map<String, dynamic> json) =>
      _$SuccessIndexLineChartFromJson(json);
  Map<String, dynamic> toJson() => _$SuccessIndexLineChartToJson(this);
}
