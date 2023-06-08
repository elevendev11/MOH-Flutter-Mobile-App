// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogResponse _$LogResponseFromJson(Map<String, dynamic> json) => LogResponse(
      successIndexcreatedAtLatest: DateUtil.dateTimeFromEpochUsNullable(
          json['successIndexcreatedAtLatest'] as int?),
      successIndexcreatedAtSecondLast: DateUtil.dateTimeFromEpochUsNullable(
          json['successIndexcreatedAtSecondLast'] as int?),
      happinessCreatedAtLatest: DateUtil.dateTimeFromEpochUsNullable(
          json['happinessCreatedAtLatest'] as int?),
      happinessCreatedAtSecondLast: DateUtil.dateTimeFromEpochUsNullable(
          json['happinessCreatedAtSecondLast'] as int?),
      evaluationIntellectCreatedAtLatest: DateUtil.dateTimeFromEpochUsNullable(
          json['evaluationIntellectCreatedAtLatest'] as int?),
      evaluationMindCreatedAtLatest: DateUtil.dateTimeFromEpochUsNullable(
          json['evaluationMindCreatedAtLatest'] as int?),
      evaluationMindCreatedAtSecondLast: DateUtil.dateTimeFromEpochUsNullable(
          json['evaluationMindCreatedAtSecondLast'] as int?),
    )..evaluationIntellectCreatedAtSecondLast =
        DateUtil.dateTimeFromEpochUsNullable(
            json['evaluationIntellectCreatedAtSecondLast'] as int?);

Map<String, dynamic> _$LogResponseToJson(LogResponse instance) =>
    <String, dynamic>{
      'successIndexcreatedAtLatest': DateUtil.dateTimeToEpochUsNullable(
          instance.successIndexcreatedAtLatest),
      'successIndexcreatedAtSecondLast': DateUtil.dateTimeToEpochUsNullable(
          instance.successIndexcreatedAtSecondLast),
      'happinessCreatedAtLatest':
          DateUtil.dateTimeToEpochUsNullable(instance.happinessCreatedAtLatest),
      'happinessCreatedAtSecondLast': DateUtil.dateTimeToEpochUsNullable(
          instance.happinessCreatedAtSecondLast),
      'evaluationIntellectCreatedAtLatest': DateUtil.dateTimeToEpochUsNullable(
          instance.evaluationIntellectCreatedAtLatest),
      'evaluationIntellectCreatedAtSecondLast':
          DateUtil.dateTimeToEpochUsNullable(
              instance.evaluationIntellectCreatedAtSecondLast),
      'evaluationMindCreatedAtLatest': DateUtil.dateTimeToEpochUsNullable(
          instance.evaluationMindCreatedAtLatest),
      'evaluationMindCreatedAtSecondLast': DateUtil.dateTimeToEpochUsNullable(
          instance.evaluationMindCreatedAtSecondLast),
    };
