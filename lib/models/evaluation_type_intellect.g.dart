// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_type_intellect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvaluationTypeIntellect _$EvaluationTypeIntellectFromJson(
        Map<String, dynamic> json) =>
    EvaluationTypeIntellect(
      categoryId: json['categoryId'] ??0,
      categoryName: json['categoryName'] ??"",
      sectionId: json['sectionId'] ??0,
      fullSectionIntellectName: json['fullSectionIntellectName'] ??"",
      questionId: json['questionId'] ??0,
      questionStatement: json['questionStatement'] ??"",
      minSlider: json['minSlider'] ??0,
      maxSlider: json['maxSlider'] ??0,
          lastsliderValue: json['lastsliderValue'] != null
              ? (json['lastsliderValue'] as num?)?.toDouble()
              : 0,
          questionInfo: json['questionInfo'] ?? "",
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
