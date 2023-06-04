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
      latestRecord: (json['latestRecord'] as num?)?.toDouble(),
      secondLastRecord: (json['secondLastRecord'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HappinessIndexResultToJson(
        HappinessIndexResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'sectionId': instance.sectionId,
      'sectionTitle': instance.sectionTitle,
      'latestRecord': instance.latestRecord,
      'secondLastRecord': instance.secondLastRecord,
    };
