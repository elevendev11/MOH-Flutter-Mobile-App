import 'package:json_annotation/json_annotation.dart';

part 'assesments.g.dart';

@JsonSerializable()
class Assesment {
  final int id;
  final String title;
  final int questionTypeId;

  List<Choice>? choiceList;

  Assesment({
    required this.id,
    required this.title,
    this.choiceList,
    required this.questionTypeId,
  });

  factory Assesment.fromJson(Map<String, dynamic> json) =>
      _$AssesmentFromJson(json);

  Map<String, dynamic> toJson() => _$AssesmentToJson(this);
}

@JsonSerializable()
class Choice {
  final int id;
  final String choiceStatement;
  final int assesmentId;

  Choice({
    required this.id,
    required this.choiceStatement,
    required this.assesmentId,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
  Map<String, dynamic> toJson() => _$ChoiceToJson(this);
}
