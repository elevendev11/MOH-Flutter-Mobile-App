// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_mind_question_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvaluationMindQuestionResult _$EvaluationMindQuestionResultFromJson(
        Map<String, dynamic> json) =>
    EvaluationMindQuestionResult(
      id: json['id'] as int,
      userId: json['userId'] as int,
      sectionId: json['sectionId'] as int,
      sectionTitle: json['sectionTitle'] as String,
      selectedSliderValue: (json['selectedSliderValue'] as num).toDouble(),
      questionStatement: json['questionStatement'] as String,
      mindintensity: json['mindintensity'] as String,
      createdAt:
          const DateTimeEpochConverter().fromJson(json['createdAt'] as int),
    );

Map<String, dynamic> _$EvaluationMindQuestionResultToJson(
        EvaluationMindQuestionResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'sectionId': instance.sectionId,
      'sectionTitle': instance.sectionTitle,
      'selectedSliderValue': instance.selectedSliderValue,
      'questionStatement': instance.questionStatement,
      'mindintensity': instance.mindintensity,
      'createdAt': const DateTimeEpochConverter().toJson(instance.createdAt),
    };
