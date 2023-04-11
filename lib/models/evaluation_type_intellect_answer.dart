import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'evaluation_type_intellect_answer.g.dart';

@JsonSerializable()
class EvaluationTypeIntellectAnswer extends Equatable {
  final int sectionId;
  int? oidQuestion;
  double? sliderValue;

  EvaluationTypeIntellectAnswer({
    required this.sectionId,
    this.oidQuestion,
    this.sliderValue,
  });

  factory EvaluationTypeIntellectAnswer.fromJson(Map<String, dynamic> json) => _$EvaluationTypeIntellectAnswerFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluationTypeIntellectAnswerToJson(this);

  @override
  List<Object?> get props => [sectionId, oidQuestion];
}
