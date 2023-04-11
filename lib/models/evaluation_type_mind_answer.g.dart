// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_type_mind_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvaluationTypeMindAnswer _$EvaluationTypeMindAnswerFromJson(
        Map<String, dynamic> json) =>
    EvaluationTypeMindAnswer(
      sectionId: json['sectionId'] as int,
      oidQuestion: json['oidQuestion'] as int?,
      sliderValue: (json['sliderValue'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$EvaluationTypeMindAnswerToJson(
        EvaluationTypeMindAnswer instance) =>
    <String, dynamic>{
      'sectionId': instance.sectionId,
      'oidQuestion': instance.oidQuestion,
      'sliderValue': instance.sliderValue,
    };
