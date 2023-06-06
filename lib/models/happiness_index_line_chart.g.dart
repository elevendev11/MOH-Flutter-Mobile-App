// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'happiness_index_line_chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HappinessIndexLineChart _$HappinessIndexLineChartFromJson(
        Map<String, dynamic> json) =>
    HappinessIndexLineChart(
      id: json['id'] as int,
      userId: json['userId'] as int,
      createdAt:
          const DateTimeEpochConverter().fromJson(json['createdAt'] as int),
      sliderValueAverage: (json['sliderValueAverage'] as num).toDouble(),
    );

Map<String, dynamic> _$HappinessIndexLineChartToJson(
        HappinessIndexLineChart instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'createdAt': const DateTimeEpochConverter().toJson(instance.createdAt),
      'sliderValueAverage': instance.sliderValueAverage,
    };
