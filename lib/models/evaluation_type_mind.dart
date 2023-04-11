import 'package:json_annotation/json_annotation.dart';
part 'evaluation_type_mind.g.dart';

@JsonSerializable()
class EvaluationTypeMind {
  final int categoryId;
  final String categoryName;
  final int sectionId;
  final String sectionName;
  final int questionId;
  final String? questionStatement;
  final int minSlider;
  final int maxSlider;
  double? lastsliderValue;

  EvaluationTypeMind({
    required this.categoryId,
    required this.categoryName,
    required this.sectionId,
    required this.sectionName,
    required this.questionId,
    this.questionStatement,
    required this.minSlider,
    required this.maxSlider,
    this.lastsliderValue
  });

  factory EvaluationTypeMind.fromJson(Map<String, dynamic> json) => _$EvaluationTypeMindFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluationTypeMindToJson(this);
}
