// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_index_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessResult _$SuccessResultFromJson(Map<String, dynamic> json) =>
    SuccessResult(
      id: json['id'] as int,
      userId: json['userId'] as int,
      sectionId: json['sectionId'] as int,
      sectionTitle: json['sectionTitle'] as String,
      secondLastRecord: (json['secondLastRecord'] as num?)?.toDouble(),
      latestRecord: (json['latestRecord'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SuccessResultToJson(SuccessResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'sectionId': instance.sectionId,
      'sectionTitle': instance.sectionTitle,
      'secondLastRecord': instance.secondLastRecord,
      'latestRecord': instance.latestRecord,
    };
