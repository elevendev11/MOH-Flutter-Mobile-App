import 'package:equatable/equatable.dart';
import 'package:sa_cooperation/models/happiness_index_result.dart';
import 'package:sa_cooperation/models/success_index_result.dart';

abstract class HappinessIndexResultState extends Equatable {
  @override
  List<Object> get props => [];
}

class HappinessIndexResultInitial extends HappinessIndexResultState {}

class HappinessIndexResultLoading extends HappinessIndexResultState {}

class HappinessIndexResultLoaded extends HappinessIndexResultState {
  final List<HappinessIndexResult> happinessIndexResultList;
  HappinessIndexResultLoaded(this.happinessIndexResultList);

  List<Object> get props => [happinessIndexResultList];
}

class HappinessIndexResultError extends HappinessIndexResultState {
  final String message;
  HappinessIndexResultError(this.message);
  List<Object> get props => [message];
}
