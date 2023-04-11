import 'package:json_annotation/json_annotation.dart';
import 'package:sa_cooperation/models/evaluation_type_intellect_answer.dart';

part 'evaluation_type_intellect_response.g.dart';

@JsonSerializable()
class EvaluationTypeIntellectResponse {
  final int userId;
  final List<EvaluationTypeIntellectAnswer> answerList;

  EvaluationTypeIntellectResponse({
    required this.userId,
    required this.answerList,
  });

  factory EvaluationTypeIntellectResponse.fromJson(Map<String, dynamic> json) => _$EvaluationTypeIntellectResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluationTypeIntellectResponseToJson(this);
}
