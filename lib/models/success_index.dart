import 'package:json_annotation/json_annotation.dart';
part 'success_index.g.dart';

@JsonSerializable()
class SuccessIndex {
  final int categoryId;
  final String categoryName;
  final int sectionId;
  final String sectionName;
  final int questionId;
  final String questionStatement;
  final int minSlider;
  final int maxSlider;
  double? lastsliderValue;
  String? questionInfo;

  SuccessIndex({
    required this.categoryId,
    required this.categoryName,
    required this.sectionId,
    required this.sectionName,
    required this.questionId,
    required this.questionStatement,
    required this.minSlider,
    required this.maxSlider,
    this.lastsliderValue,
    this.questionInfo,
  });

  factory SuccessIndex.fromJson(Map<String, dynamic> json) =>
      _$SuccessIndexFromJson(json);
  Map<String, dynamic> toJson() => _$SuccessIndexToJson(this);
}
