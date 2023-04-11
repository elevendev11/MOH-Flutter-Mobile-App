// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'happiness_index_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HappinessIndexAnswer _$HappinessIndexAnswerFromJson(
        Map<String, dynamic> json) =>
    HappinessIndexAnswer(
      sectionId: json['sectionId'] as int,
      oidQuestion: json['oidQuestion'] as int?,
      sliderValue: (json['sliderValue'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HappinessIndexAnswerToJson(
        HappinessIndexAnswer instance) =>
    <String, dynamic>{
      'sectionId': instance.sectionId,
      'oidQuestion': instance.oidQuestion,
      'sliderValue': instance.sliderValue,
    };
