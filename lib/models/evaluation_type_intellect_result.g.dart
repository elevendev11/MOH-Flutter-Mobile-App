// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_type_intellect_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvaluationTypeIntellectResult _$EvaluationTypeIntellectResultFromJson(
        Map<String, dynamic> json) =>
    EvaluationTypeIntellectResult(
      id: json['id'] as int,
      userId: json['userId'] as int,
      sectionId: json['sectionId'] as int,
      sectionTitle: json['sectionTitle'] as String,
      sectionOpposite: json['sectionOpposite'] as String,
      createdAt:
          const DateTimeEpochConverter().fromJson(json['createdAt'] as int),
      sliderValueAverage: (json['sliderValueAverage'] as num).toDouble(),
    );

Map<String, dynamic> _$EvaluationTypeIntellectResultToJson(
        EvaluationTypeIntellectResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'sectionId': instance.sectionId,
      'sectionTitle': instance.sectionTitle,
      'sectionOpposite': instance.sectionOpposite,
      'createdAt': const DateTimeEpochConverter().toJson(instance.createdAt),
      'sliderValueAverage': instance.sliderValueAverage,
    };
