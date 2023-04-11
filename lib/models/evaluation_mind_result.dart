import 'package:json_annotation/json_annotation.dart';
import 'package:sa_cooperation/models/date_time_epoch_converter.dart';
part 'evaluation_mind_result.g.dart';

@JsonSerializable()
@DateTimeEpochConverter()
class EvaluationMindResult {
  final int id;
  final int userId;
  final String sectionTitle;
  final DateTime createdAt;
  final double sliderValueAverage;

  EvaluationMindResult({
    required this.id,
    required this.userId,
    required this.sectionTitle,
    required this.createdAt,
    required this.sliderValueAverage,
  });

  factory EvaluationMindResult.fromJson(Map<String, dynamic> json) => _$EvaluationMindResultFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluationMindResultToJson(this);
}
