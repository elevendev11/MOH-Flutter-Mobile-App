import 'package:equatable/equatable.dart';
import 'package:sa_cooperation/models/evaluation_type_mind.dart';

abstract class EvaluationTypeMindState extends Equatable {
  @override
  List<Object> get props => [];
}

class EvaluationTypeMindInitial extends EvaluationTypeMindState {}

class EvaluationTypeMindLoading extends EvaluationTypeMindState {}

class EvaluationTypeMindLoaded extends EvaluationTypeMindState {
  final List<EvaluationTypeMind> evaluationTypeMindList;
  EvaluationTypeMindLoaded(this.evaluationTypeMindList);

  List<Object> get props => [evaluationTypeMindList];
}

class EvaluationTypeMindError extends EvaluationTypeMindState {
  final String message;
  EvaluationTypeMindError(this.message);
  List<Object> get props => [message];
}
