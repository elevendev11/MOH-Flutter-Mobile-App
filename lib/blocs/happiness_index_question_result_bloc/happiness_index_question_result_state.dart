import 'package:equatable/equatable.dart';
import 'package:sa_cooperation/models/happiness_index_question_result.dart';

abstract class HappinessIndexQuestionResultState extends Equatable {
  @override
  List<Object> get props => [];
}

class HappinessIndexQuestionResultInitial extends HappinessIndexQuestionResultState {}

class HappinessIndexQuestionResultLoading extends HappinessIndexQuestionResultState {}

class HappinessIndexQuestionResultLoaded extends HappinessIndexQuestionResultState {
  final List<HappinessIndexQuestionResult> happinessIndexQuestionResultList;
  HappinessIndexQuestionResultLoaded(this.happinessIndexQuestionResultList);

  List<Object> get props => [happinessIndexQuestionResultList];
}

class HappinessIndexQuestionResultError extends HappinessIndexQuestionResultState {
  final String message;
  HappinessIndexQuestionResultError(this.message);
  List<Object> get props => [message];
}
