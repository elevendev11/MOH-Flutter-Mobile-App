import 'package:json_annotation/json_annotation.dart';
import 'package:sa_cooperation/models/success_index_answer.dart';
part 'success_index_response.g.dart';

@JsonSerializable()
class SuccessIndexResponse {
  final int userId;
  final List<SuccessIndexAnswer> answerList;

  SuccessIndexResponse({
    required this.userId,
    required this.answerList,
  });

  factory SuccessIndexResponse.fromJson(Map<String, dynamic> json) => _$SuccessIndexResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SuccessIndexResponseToJson(this);

  
}
