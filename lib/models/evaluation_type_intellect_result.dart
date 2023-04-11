import 'package:json_annotation/json_annotation.dart';
import 'package:sa_cooperation/models/date_time_epoch_converter.dart';
part 'evaluation_type_intellect_result.g.dart';

@JsonSerializable()
@DateTimeEpochConverter()
class EvaluationTypeIntellectResult {
  final int id;
  final int userId;
  final int sectionId;
  final String sectionTitle;
  final String sectionOpposite;
  final DateTime createdAt;
  final double sliderValueAverage;

  EvaluationTypeIntellectResult({
    required this.id,
    required this.userId,
    required this.sectionId,
    required this.sectionTitle,
    required this.sectionOpposite,
    required this.createdAt,
    required this.sliderValueAverage,
  });

    factory EvaluationTypeIntellectResult.fromJson(Map<String, dynamic> json) => _$EvaluationTypeIntellectResultFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluationTypeIntellectResultToJson(this);
}
