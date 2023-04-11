// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_type_intellect_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvaluationTypeIntellectAnswer _$EvaluationTypeIntellectAnswerFromJson(
        Map<String, dynamic> json) =>
    EvaluationTypeIntellectAnswer(
      sectionId: json['sectionId'] as int,
      oidQuestion: json['oidQuestion'] as int?,
      sliderValue: (json['sliderValue'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$EvaluationTypeIntellectAnswerToJson(
        EvaluationTypeIntellectAnswer instance) =>
    <String, dynamic>{
      'sectionId': instance.sectionId,
      'oidQuestion': instance.oidQuestion,
      'sliderValue': instance.sliderValue,
    };
