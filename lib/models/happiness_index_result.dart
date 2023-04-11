import 'package:json_annotation/json_annotation.dart';
import 'package:sa_cooperation/models/date_time_epoch_converter.dart';
part 'happiness_index_result.g.dart';

@JsonSerializable()
@DateTimeEpochConverter()
class HappinessIndexResult {
  final int id;
  final int userId;
  final int sectionId;
  final String sectionTitle;
  final DateTime createdAt;
  final int responseCount;
  final double sliderValueAverage;

  HappinessIndexResult({
    required this.id,
    required this.userId,
    required this.sectionId,
    required this.sectionTitle,
    required this.createdAt,
    required this.responseCount,
    required this.sliderValueAverage,
  });

  factory HappinessIndexResult.fromJson(Map<String, dynamic> json) => _$HappinessIndexResultFromJson(json);
  Map<String, dynamic> toJson() => _$HappinessIndexResultToJson(this);
}
