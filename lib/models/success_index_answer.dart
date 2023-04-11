import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'success_index_answer.g.dart';

@JsonSerializable()
class SuccessIndexAnswer extends Equatable {
  final int sectionId;
  int? oidQuestion;
  int? oidChoice;
  double? sliderValue;

  SuccessIndexAnswer({
    required this.sectionId,
    this.oidQuestion,
    this.oidChoice,
    this.sliderValue,
  });

  factory SuccessIndexAnswer.fromJson(Map<String, dynamic> json) => _$SuccessIndexAnswerFromJson(json);
  Map<String, dynamic> toJson() => _$SuccessIndexAnswerToJson(this);

  @override
  List<Object?> get props => [sectionId, oidQuestion];
}
