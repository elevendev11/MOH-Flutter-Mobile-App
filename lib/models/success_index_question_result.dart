import 'package:json_annotation/json_annotation.dart';
part 'success_index_question_result.g.dart';

@JsonSerializable()
class SuccessIndexQuestionResult {
  final String sectionTitle;
  final String categoryTitle;
  final int sectionId;
  List<Question>? questionList;

  SuccessIndexQuestionResult({required this.sectionTitle, required this.categoryTitle, required this.sectionId, this.questionList});

  factory SuccessIndexQuestionResult.fromJson(Map<String, dynamic> json) => _$SuccessIndexQuestionResultFromJson(json);
  Map<String, dynamic> toJson() => _$SuccessIndexQuestionResultToJson(this);
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
