import 'package:equatable/equatable.dart';
import 'package:sa_cooperation/models/evaluation_mind_result.dart';

abstract class EvaluationMindResultState extends Equatable {
  @override
  List<Object> get props => [];
}

class EvaluationMindResultInitial extends EvaluationMindResultState {}

class EvaluationMindResultLoading extends EvaluationMindResultState {}

class EvaluationMindResultLoaded extends EvaluationMindResultState {
  final List<EvaluationMindResult> evaluationMindResultList;
  EvaluationMindResultLoaded(this.evaluationMindResultList);

  List<Object> get props => [evaluationMindResultList];
}

class EvaluationMindResultError extends EvaluationMindResultState {
  final String message;
  EvaluationMindResultError(this.message);
  List<Object> get props => [message];
}
