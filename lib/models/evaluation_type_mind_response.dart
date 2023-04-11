import 'package:json_annotation/json_annotation.dart';
import 'package:sa_cooperation/models/evaluation_type_mind_answer.dart';

part 'evaluation_type_mind_response.g.dart';

@JsonSerializable()
class EvaluationTypeMindResponse {
  final int userId;
  final List<EvaluationTypeMindAnswer> answerList;

  EvaluationTypeMindResponse({
    required this.userId,
    required this.answerList,
  });

  factory EvaluationTypeMindResponse.fromJson(Map<String, dynamic> json) => _$EvaluationTypeMindResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluationTypeMindResponseToJson(this);

  
}
