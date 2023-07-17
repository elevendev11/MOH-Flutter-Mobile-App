import 'package:json_annotation/json_annotation.dart';
part 'evaluation_type_intellect.g.dart';

@JsonSerializable()
class EvaluationTypeIntellect {
  final int categoryId;
  final String categoryName;
  final int sectionId;
  final String fullSectionIntellectName;
  final int questionId;
  final String questionStatement;
  final int minSlider;
  final int maxSlider;
  double? lastsliderValue;
  String? questionInfo;

  EvaluationTypeIntellect({
    required this.categoryId,
    required this.categoryName,
    required this.sectionId,
    required this.fullSectionIntellectName,
    required this.questionId,
    required this.questionStatement,
    required this.minSlider,
    required this.maxSlider,
    this.lastsliderValue,
    this.questionInfo,
  });

  factory EvaluationTypeIntellect.fromJson(Map<String, dynamic> json) =>
      _$EvaluationTypeIntellectFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluationTypeIntellectToJson(this);
}
