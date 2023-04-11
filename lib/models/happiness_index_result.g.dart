// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'happiness_index_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HappinessIndexResult _$HappinessIndexResultFromJson(
        Map<String, dynamic> json) =>
    HappinessIndexResult(
      id: json['id'] as int,
      userId: json['userId'] as int,
      sectionId: json['sectionId'] as int,
      sectionTitle: json['sectionTitle'] as String,
      createdAt:
          const DateTimeEpochConverter().fromJson(json['createdAt'] as int),
      responseCount: json['responseCount'] as int,
      sliderValueAverage: (json['sliderValueAverage'] as num).toDouble(),
    );

Map<String, dynamic> _$HappinessIndexResultToJson(
        HappinessIndexResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'sectionId': instance.sectionId,
      'sectionTitle': instance.sectionTitle,
      'createdAt': const DateTimeEpochConverter().toJson(instance.createdAt),
      'responseCount': instance.responseCount,
      'sliderValueAverage': instance.sliderValueAverage,
    };
