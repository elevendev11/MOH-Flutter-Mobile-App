import 'package:json_annotation/json_annotation.dart';

import 'date_time_epoch_converter.dart';
part 'evaluation_mind_question_result.g.dart';

@JsonSerializable()
@DateTimeEpochConverter()
class EvaluationMindQuestionResult {
  final int id;
  final int userId;
  final int sectionId;
  final String sectionTitle;
  final double selectedSliderValue;
  final String questionStatement;
  final String mindintensity;
  final DateTime createdAt;

  EvaluationMindQuestionResult({
    required this.id,
    required this.userId,
    required this.sectionId,
    required this.sectionTitle,
    required this.selectedSliderValue,
    required this.questionStatement,
    required this.mindintensity,
    required this.createdAt,
  });

  factory EvaluationMindQuestionResult.fromJson(Map<String, dynamic> json) => _$EvaluationMindQuestionResultFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluationMindQuestionResultToJson(this);
}
