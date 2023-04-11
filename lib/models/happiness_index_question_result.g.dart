// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'happiness_index_question_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HappinessIndexQuestionResult _$HappinessIndexQuestionResultFromJson(
        Map<String, dynamic> json) =>
    HappinessIndexQuestionResult(
      sectionTitle: json['sectionTitle'] as String,
      categoryTitle: json['categoryTitle'] as String,
      sectionId: json['sectionId'] as int,
      questionList: (json['questionList'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HappinessIndexQuestionResultToJson(
        HappinessIndexQuestionResult instance) =>
    <String, dynamic>{
      'sectionTitle': instance.sectionTitle,
      'categoryTitle': instance.categoryTitle,
      'sectionId': instance.sectionId,
      'questionList': instance.questionList,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      sliderValue: (json['sliderValue'] as num?)?.toDouble(),
      questionStatement: json['questionStatement'] as String?,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'sliderValue': instance.sliderValue,
      'questionStatement': instance.questionStatement,
    };
