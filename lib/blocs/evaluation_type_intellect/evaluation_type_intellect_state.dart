import 'package:equatable/equatable.dart';
import 'package:sa_cooperation/models/evaluation_type_intellect.dart';


abstract class EvaluationTypeIntellectState extends Equatable {
  @override
  List<Object> get props => [];
}

class EvaluationTypeIntellectInitial extends EvaluationTypeIntellectState {}

class EvaluationTypeIntellectLoading extends EvaluationTypeIntellectState {}

class EvaluationTypeIntellectLoaded extends EvaluationTypeIntellectState {
  final List<EvaluationTypeIntellect> evaluationTypeIntellectList;
  EvaluationTypeIntellectLoaded(this.evaluationTypeIntellectList);

  List<Object> get props => [evaluationTypeIntellectList];
}

class EvaluationTypeIntellectError extends EvaluationTypeIntellectState {
  final String message;
  EvaluationTypeIntellectError(this.message);
  List<Object> get props => [message];
}

