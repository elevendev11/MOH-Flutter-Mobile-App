// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'happiness_index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HappinessIndex _$HappinessIndexFromJson(Map<String, dynamic> json) =>
    HappinessIndex(
      categoryId: json['categoryId'] ?? 0,
      categoryName: json['categoryName'] ?? "",
      sectionId: json['sectionId'] ?? 0,
      sectionName: json['sectionName'] ?? "",
      questionId: json['questionId'] ?? 0,
      questionStatement: json['questionStatement'] ?? "",
      minSlider: json['minSlider'] ?? 0,
      maxSlider: json['maxSlider'] ?? 0,
      lastsliderValue: json['lastsliderValue'] != null
          ? (json['lastsliderValue'] as num?)?.toDouble()
          : 0,
      questionInfo: json['questionInfo'] ?? "",
    );

Map<String, dynamic> _$HappinessIndexToJson(HappinessIndex instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'sectionId': instance.sectionId,
      'sectionName': instance.sectionName,
      'questionId': instance.questionId,
      'questionStatement': instance.questionStatement,
      'minSlider': instance.minSlider,
      'maxSlider': instance.maxSlider,
      'lastsliderValue': instance.lastsliderValue,
      'questionInfo': instance.questionInfo,
    };
