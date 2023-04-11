import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'happiness_index_answer.g.dart';

@JsonSerializable()
class HappinessIndexAnswer extends Equatable {
  final int sectionId;
  int? oidQuestion;
  double? sliderValue;

  HappinessIndexAnswer({
    required this.sectionId,
    this.oidQuestion,
    this.sliderValue,
  });

  factory HappinessIndexAnswer.fromJson(Map<String, dynamic> json) => _$HappinessIndexAnswerFromJson(json);
  Map<String, dynamic> toJson() => _$HappinessIndexAnswerToJson(this);

  @override
  List<Object?> get props => [sectionId, oidQuestion];
}
