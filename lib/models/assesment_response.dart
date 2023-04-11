import 'package:json_annotation/json_annotation.dart';
import 'answer_response.dart';
part 'assesment_response.g.dart';

@JsonSerializable()
class SurveyResponse {
  final List<AnswerResponse> answerList;

  SurveyResponse(
    this.answerList,
  );

  factory SurveyResponse.fromJson(Map<String, dynamic> json) => _$SurveyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SurveyResponseToJson(this);
}
