import 'package:equatable/equatable.dart';
import 'package:sa_cooperation/models/evaluation_mind_question_result.dart';

abstract class EvaluationMindQuestionResultState extends Equatable {
  @override
  List<Object> get props => [];
}

class EvaluationMindQuestionResultInitial extends EvaluationMindQuestionResultState {}

class EvaluationMindQuestionResultLoading extends EvaluationMindQuestionResultState {}

class EvaluationMindQuestionResultLoaded extends EvaluationMindQuestionResultState {
  final List<EvaluationMindQuestionResult> evaluationMindQuestionResultList;
  EvaluationMindQuestionResultLoaded(this.evaluationMindQuestionResultList);

  List<Object> get props => [evaluationMindQuestionResultList];
}

class EvaluationMindQuestionResultError extends EvaluationMindQuestionResultState {
  final String message;
  EvaluationMindQuestionResultError(this.message);
  List<Object> get props => [message];
}
