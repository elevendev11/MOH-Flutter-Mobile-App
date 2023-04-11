// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_type_mind_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvaluationTypeMindResponse _$EvaluationTypeMindResponseFromJson(
        Map<String, dynamic> json) =>
    EvaluationTypeMindResponse(
      userId: json['userId'] as int,
      answerList: (json['answerList'] as List<dynamic>)
          .map((e) =>
              EvaluationTypeMindAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EvaluationTypeMindResponseToJson(
        EvaluationTypeMindResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'answerList': instance.answerList,
    };
