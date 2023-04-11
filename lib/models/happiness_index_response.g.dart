// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'happiness_index_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HappinessIndexResponse _$HappinessIndexResponseFromJson(
        Map<String, dynamic> json) =>
    HappinessIndexResponse(
      userId: json['userId'] as int,
      answerList: (json['answerList'] as List<dynamic>)
          .map((e) => HappinessIndexAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HappinessIndexResponseToJson(
        HappinessIndexResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'answerList': instance.answerList,
    };
