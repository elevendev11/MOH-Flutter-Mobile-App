// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_index_line_chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessIndexLineChart _$SuccessIndexLineChartFromJson(
        Map<String, dynamic> json) =>
    SuccessIndexLineChart(
      createdAt:
          const DateTimeEpochConverter().fromJson(json['createdAt'] as int),
      sliderValueAverage: (json['sliderValueAverage'] as num).toDouble(),
      id: json['id'] as int,
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$SuccessIndexLineChartToJson(
        SuccessIndexLineChart instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'createdAt': const DateTimeEpochConverter().toJson(instance.createdAt),
      'sliderValueAverage': instance.sliderValueAverage,
    };
