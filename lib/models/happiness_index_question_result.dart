import 'package:json_annotation/json_annotation.dart';
part 'happiness_index_question_result.g.dart';

@JsonSerializable()
class HappinessIndexQuestionResult {
  final String sectionTitle;
  final String categoryTitle;
  final int sectionId;
  List<Question>? questionList;

  HappinessIndexQuestionResult({
    required this.sectionTitle,
    required this.categoryTitle,
    required this.sectionId,
    this.questionList,
  });

  factory HappinessIndexQuestionResult.fromJson(Map<String, dynamic> json) => _$HappinessIndexQuestionResultFromJson(json);
  Map<String, dynamic> toJson() => _$HappinessIndexQuestionResultToJson(this);
}

@JsonSerializable()
class Question {
  double? sliderValue;
  String? questionStatement;

  Question({
     this.sliderValue,
     this.questionStatement,
  });

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
  Map<String, dynamic> tojson() => _$QuestionToJson(this);
}
