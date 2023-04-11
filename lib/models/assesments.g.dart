// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assesments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Assesment _$AssesmentFromJson(Map<String, dynamic> json) => Assesment(
      id: json['id'] as int,
      title: json['title'] as String,
      choiceList: (json['choiceList'] as List<dynamic>)
          .map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
      questionTypeId: json['questionTypeId'] as int,
    );

Map<String, dynamic> _$AssesmentToJson(Assesment instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'questionTypeId': instance.questionTypeId,
      'choiceList': instance.choiceList,
    };

Choice _$ChoiceFromJson(Map<String, dynamic> json) => Choice(
      id: json['id'] as int,
      choiceStatement: json['choiceStatement'] as String,
      assesmentId: json['assesmentId'] as int,
    );

Map<String, dynamic> _$ChoiceToJson(Choice instance) => <String, dynamic>{
      'id': instance.id,
      'choiceStatement': instance.choiceStatement,
      'assesmentId': instance.assesmentId,
    };
