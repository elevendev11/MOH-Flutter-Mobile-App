// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_mind_question_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvaluationMindQuestionResult _$EvaluationMindQuestionResultFromJson(
        Map<String, dynamic> json) =>
    EvaluationMindQuestionResult(
      id: json['id'] ??0,
      userId: json['userId'] ??0,
      sectionId: json['sectionId'] ??0,
      sectionTitle: json['sectionTitle'] ??"",
      selectedSliderValue:json['selectedSliderValue']!=null? (json['selectedSliderValue'] as num).toDouble():0,
      questionStatement: json['questionStatement']??"",
      mindintensity: json['mindintensity'] ??"",
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
