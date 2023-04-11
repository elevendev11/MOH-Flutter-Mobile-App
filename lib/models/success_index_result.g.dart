// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_index_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessResult _$SuccessResultFromJson(Map<String, dynamic> json) =>
    SuccessResult(
      const DateTimeEpochConverter().fromJson(json['createdAt'] as int),
      json['responseCount'] as int,
      (json['sliderValueAverage'] as num).toDouble(),
      id: json['id'] as int,
      userId: json['userId'] as int,
      sectionId: json['sectionId'] as int,
      sectionTitle: json['sectionTitle'] as String,
    );

Map<String, dynamic> _$SuccessResultToJson(SuccessResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'sectionId': instance.sectionId,
      'sectionTitle': instance.sectionTitle,
      'createdAt': const DateTimeEpochConverter().toJson(instance.createdAt),
      'responseCount': instance.responseCount,
      'sliderValueAverage': instance.sliderValueAverage,
    };
