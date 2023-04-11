// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_mind_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvaluationMindResult _$EvaluationMindResultFromJson(
        Map<String, dynamic> json) =>
    EvaluationMindResult(
      id: json['id'] as int,
      userId: json['userId'] as int,
      sectionTitle: json['sectionTitle'] as String,
      createdAt:
          const DateTimeEpochConverter().fromJson(json['createdAt'] as int),
      sliderValueAverage: (json['sliderValueAverage'] as num).toDouble(),
    );

Map<String, dynamic> _$EvaluationMindResultToJson(
        EvaluationMindResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'sectionTitle': instance.sectionTitle,
      'createdAt': const DateTimeEpochConverter().toJson(instance.createdAt),
      'sliderValueAverage': instance.sliderValueAverage,
    };
