// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_type_intellect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvaluationTypeIntellect _$EvaluationTypeIntellectFromJson(
        Map<String, dynamic> json) =>
    EvaluationTypeIntellect(
      categoryId: json['categoryId'] as int,
      categoryName: json['categoryName'] as String,
      sectionId: json['sectionId'] as int,
      fullSectionIntellectName: json['fullSectionIntellectName'] as String,
      questionId: json['questionId'] as int,
      questionStatement: json['questionStatement'] as String,
      minSlider: json['minSlider'] as int,
      maxSlider: json['maxSlider'] as int,
      lastsliderValue: (json['lastsliderValue'] as num?)?.toDouble(),
      questionInfo: json['questionInfo'] as String?,
    );

Map<String, dynamic> _$EvaluationTypeIntellectToJson(
        EvaluationTypeIntellect instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'sectionId': instance.sectionId,
      'fullSectionIntellectName': instance.fullSectionIntellectName,
      'questionId': instance.questionId,
      'questionStatement': instance.questionStatement,
      'minSlider': instance.minSlider,
      'maxSlider': instance.maxSlider,
      'lastsliderValue': instance.lastsliderValue,
      'questionInfo': instance.questionInfo,
    };
