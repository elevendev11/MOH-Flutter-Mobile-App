import 'package:json_annotation/json_annotation.dart';
import 'package:sa_cooperation/models/date_time_epoch_converter.dart';
part 'happiness_index_line_chart.g.dart';

@JsonSerializable()
@DateTimeEpochConverter()
class HappinessIndexLineChart {
  final int id;
  final int userId;
  final DateTime createdAt;
  final double sliderValueAverage;

  HappinessIndexLineChart({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.sliderValueAverage,
  });

  factory HappinessIndexLineChart.fromJson(Map<String, dynamic> json) => _$HappinessIndexLineChartFromJson(json);
  Map<String, dynamic> toJson() => _$HappinessIndexLineChartToJson(this);
}
