// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessIndex _$SuccessIndexFromJson(Map<String, dynamic> json) => SuccessIndex(
      categoryId: json['categoryId'] as int,
      categoryName: json['categoryName'] as String,
      sectionId: json['sectionId'] as int,
      sectionName: json['sectionName'] as String,
      questionId: json['questionId'] as int,
      questionStatement: json['questionStatement'] as String,
      minSlider: json['minSlider'] as int,
      maxSlider: json['maxSlider'] as int,
      lastsliderValue: (json['lastsliderValue'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SuccessIndexToJson(SuccessIndex instance) =>
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
    };
