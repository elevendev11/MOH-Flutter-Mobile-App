// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_type_intellect_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvaluationTypeIntellectResponse _$EvaluationTypeIntellectResponseFromJson(
        Map<String, dynamic> json) =>
    EvaluationTypeIntellectResponse(
      userId: json['userId'] as int,
      answerList: (json['answerList'] as List<dynamic>)
          .map((e) =>
              EvaluationTypeIntellectAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EvaluationTypeIntellectResponseToJson(
        EvaluationTypeIntellectResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'answerList': instance.answerList,
    };
