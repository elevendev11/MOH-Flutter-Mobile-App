// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_index_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessIndexResponse _$SuccessIndexResponseFromJson(
        Map<String, dynamic> json) =>
    SuccessIndexResponse(
      userId: json['userId'] as int,
      answerList: (json['answerList'] as List<dynamic>)
          .map((e) => SuccessIndexAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SuccessIndexResponseToJson(
        SuccessIndexResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'answerList': instance.answerList,
    };
