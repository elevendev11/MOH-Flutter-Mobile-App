import 'package:json_annotation/json_annotation.dart';
import 'package:sa_cooperation/models/date_time_epoch_converter.dart';
import 'package:sa_cooperation/utils/date_util.dart';
part 'log_response.g.dart';

@JsonSerializable()
@DateTimeEpochConverter()
class LogResponse {
  @JsonKey(
    fromJson: DateUtil.dateTimeFromEpochUsNullable,
    toJson: DateUtil.dateTimeToEpochUsNullable,
  )
  DateTime? successIndexcreatedAtLatest;

  String formattedsuccessIndexcreatedAtLatest() =>
      successIndexcreatedAtLatest != null
          ? DateUtil.defaultDateFormat.format(successIndexcreatedAtLatest!)
          : 'N/A';

  @JsonKey(
    fromJson: DateUtil.dateTimeFromEpochUsNullable,
    toJson: DateUtil.dateTimeToEpochUsNullable,
  )
  DateTime? successIndexcreatedAtSecondLast;

  String formattedsuccessIndexcreatedAtSecondLast() =>
      successIndexcreatedAtSecondLast != null
          ? DateUtil.defaultDateFormat.format(successIndexcreatedAtSecondLast!)
          : 'N/A';

  @JsonKey(
    fromJson: DateUtil.dateTimeFromEpochUsNullable,
    toJson: DateUtil.dateTimeToEpochUsNullable,
  )
  DateTime? happinessCreatedAtLatest;

  String formattedhappinessCreatedAtLatest() => happinessCreatedAtLatest != null
      ? DateUtil.defaultDateFormat.format(happinessCreatedAtLatest!)
      : 'N/A';

  @JsonKey(
    fromJson: DateUtil.dateTimeFromEpochUsNullable,
    toJson: DateUtil.dateTimeToEpochUsNullable,
  )
  DateTime? happinessCreatedAtSecondLast;

  String formattedhappinessCreatedAtSecondLast() =>
      happinessCreatedAtSecondLast != null
          ? DateUtil.defaultDateFormat.format(happinessCreatedAtSecondLast!)
          : 'N/A';

  @JsonKey(
    fromJson: DateUtil.dateTimeFromEpochUsNullable,
    toJson: DateUtil.dateTimeToEpochUsNullable,
  )
  DateTime? evaluationIntellectCreatedAtLatest;

  String formattedevaluationIntellectCreatedAtLatest() =>
      evaluationIntellectCreatedAtLatest != null
          ? DateUtil.defaultDateFormat
              .format(evaluationIntellectCreatedAtLatest!)
          : 'N/A';

  @JsonKey(
    fromJson: DateUtil.dateTimeFromEpochUsNullable,
    toJson: DateUtil.dateTimeToEpochUsNullable,
  )
  DateTime? evaluationIntellectCreatedAtSecondLast;

  String formattedevaluationIntellectCreatedAtSecondLast() =>
      evaluationIntellectCreatedAtSecondLast != null
          ? DateUtil.defaultDateFormat
              .format(evaluationIntellectCreatedAtSecondLast!)
          : 'N/A';

  @JsonKey(
    fromJson: DateUtil.dateTimeFromEpochUsNullable,
    toJson: DateUtil.dateTimeToEpochUsNullable,
  )
  DateTime? evaluationMindCreatedAtLatest;

  String formattedevaluationMindCreatedAtLatest() =>
      evaluationMindCreatedAtLatest != null
          ? DateUtil.defaultDateFormat.format(evaluationMindCreatedAtLatest!)
          : 'N/A';
  @JsonKey(
    fromJson: DateUtil.dateTimeFromEpochUsNullable,
    toJson: DateUtil.dateTimeToEpochUsNullable,
  )
  DateTime? evaluationMindCreatedAtSecondLast;

  String formattedevaluationMindCreatedAtSecondLast() =>
      evaluationMindCreatedAtSecondLast != null
          ? DateUtil.defaultDateFormat
              .format(evaluationMindCreatedAtSecondLast!)
          : 'N/A';

  LogResponse({
    this.successIndexcreatedAtLatest,
    this.successIndexcreatedAtSecondLast,
    this.happinessCreatedAtLatest,
    this.happinessCreatedAtSecondLast,
    this.evaluationIntellectCreatedAtLatest,
    this.evaluationMindCreatedAtLatest,
    this.evaluationMindCreatedAtSecondLast,
  });

  factory LogResponse.fromJson(Map<String, dynamic> json) =>
      _$LogResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LogResponseToJson(this);
}
