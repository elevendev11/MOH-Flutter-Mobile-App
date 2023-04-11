import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'evaluation_type_mind_answer.g.dart';

@JsonSerializable()
class EvaluationTypeMindAnswer extends Equatable {
  final int sectionId;
  int? oidQuestion;
  double? sliderValue;

  EvaluationTypeMindAnswer({
    required this.sectionId,
    this.oidQuestion,
    this.sliderValue,
  });

  factory EvaluationTypeMindAnswer.fromJson(Map<String, dynamic> json) => _$EvaluationTypeMindAnswerFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluationTypeMindAnswerToJson(this);

  @override
  List<Object?> get props => [sectionId, oidQuestion];
}

