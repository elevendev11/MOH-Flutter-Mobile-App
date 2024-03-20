// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_type_intellect_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvaluationTypeIntellectResult _$EvaluationTypeIntellectResultFromJson(
        Map<String, dynamic> json) =>
    EvaluationTypeIntellectResult(
      id: json['id'] ?? 0,
      userId: json['userId'] ?? 0,
      sectionId: json['sectionId'] ?? 0,
      sectionTitle: json['sectionTitle'] ?? "",
      sectionOpposite: json['sectionOpposite'] ?? "",
      createdAt:
          const DateTimeEpochConverter().fromJson(json['createdAt'] as int),
      sliderValueAverage: json['sliderValueAverage'] != null
          ? (json['sliderValueAverage'] as num).toDouble()
          : 0,
    );

Map<String, dynamic> _$EvaluationTypeIntellectResultToJson(
        EvaluationTypeIntellectResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'sectionId': instance.sectionId,
      'sectionTitle': instance.sectionTitle,
      'sectionOpposite': instance.sectionOpposite??"",
      'createdAt': const DateTimeEpochConverter().toJson(instance.createdAt),
      'sliderValueAverage': instance.sliderValueAverage,
    };
