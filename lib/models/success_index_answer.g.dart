// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_index_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessIndexAnswer _$SuccessIndexAnswerFromJson(Map<String, dynamic> json) =>
    SuccessIndexAnswer(
      sectionId: json['sectionId'] as int,
      oidQuestion: json['oidQuestion'] as int?,
      oidChoice: json['oidChoice'] as int?,
      sliderValue: (json['sliderValue'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SuccessIndexAnswerToJson(SuccessIndexAnswer instance) =>
    <String, dynamic>{
      'sectionId': instance.sectionId,
      'oidQuestion': instance.oidQuestion,
      'oidChoice': instance.oidChoice,
      'sliderValue': instance.sliderValue,
    };
