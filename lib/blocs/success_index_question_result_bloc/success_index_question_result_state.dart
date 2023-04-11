import 'package:equatable/equatable.dart';
import 'package:sa_cooperation/models/success_index_question_result.dart';

abstract class SuccessIndexQuestionResultState extends Equatable {
  @override
  List<Object> get props => [];
}

class SuccessIndexQuestionResultInitial extends SuccessIndexQuestionResultState {}

class SuccessIndexQuestionResultLoading extends SuccessIndexQuestionResultState {}

class SuccessIndexQuestionResultLoaded extends SuccessIndexQuestionResultState {
  final List<SuccessIndexQuestionResult> successIndexQuestionResultList;
  SuccessIndexQuestionResultLoaded(this.successIndexQuestionResultList);

  List<Object> get props => [successIndexQuestionResultList];
}

class SuccessIndexQuestionResultError extends SuccessIndexQuestionResultState {
  final String message;
  SuccessIndexQuestionResultError(this.message);
  List<Object> get props => [message];
}
