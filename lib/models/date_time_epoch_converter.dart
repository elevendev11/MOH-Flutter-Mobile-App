import 'package:json_annotation/json_annotation.dart';
import 'package:sa_cooperation/utils/date_util.dart';


class DateTimeEpochConverter implements JsonConverter<DateTime, int> {
  const DateTimeEpochConverter();

  @override
  DateTime fromJson(int json) => DateUtil.dateTimeFromEpochUs(json);

  @override
  int toJson(DateTime object) => DateUtil.dateTimeToEpochUs(object);
}
