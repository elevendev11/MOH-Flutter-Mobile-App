import 'package:json_annotation/json_annotation.dart';
import 'package:sa_cooperation/models/happiness_index_answer.dart';

part 'happiness_index_response.g.dart';

@JsonSerializable()
class HappinessIndexResponse {
  final int userId;
  final List<HappinessIndexAnswer> answerList;

  HappinessIndexResponse({
    required this.userId,
    required this.answerList,
  });

  factory HappinessIndexResponse.fromJson(Map<String, dynamic> json) => _$HappinessIndexResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HappinessIndexResponseToJson(this);

  
}
