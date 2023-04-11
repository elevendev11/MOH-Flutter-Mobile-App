import 'package:equatable/equatable.dart';
import 'package:sa_cooperation/models/evaluation_type_intellect_result.dart';

abstract class EvaluationTypeIntellectResultState extends Equatable {
  @override
  List<Object> get props => [];
}

class EvaluationTypeIntellectResultInitial extends EvaluationTypeIntellectResultState {}

class EvaluationTypeIntellectResultLoading extends EvaluationTypeIntellectResultState {}

class EvaluationTypeIntellectResultLoaded extends EvaluationTypeIntellectResultState {
  final List<EvaluationTypeIntellectResult> evaluationTypeIntellectResultList;
  EvaluationTypeIntellectResultLoaded(this.evaluationTypeIntellectResultList);

  List<Object> get props => [evaluationTypeIntellectResultList];
}

class EvaluationTypeIntellectResultError extends EvaluationTypeIntellectResultState {
  final String message;
  EvaluationTypeIntellectResultError(this.message);
  List<Object> get props => [message];
}
