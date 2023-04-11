import 'package:equatable/equatable.dart';
import 'package:sa_cooperation/models/happiness_index.dart';
import 'package:sa_cooperation/models/success_index.dart';

abstract class HappinessIndexState extends Equatable {
  @override
  List<Object> get props => [];
}

class HappinessIndexInitial extends HappinessIndexState {}

class HappinessIndexLoading extends HappinessIndexState {}

class HappinessIndexLoaded extends HappinessIndexState {
  final List<HappinessIndex> happinessIndexList;
  HappinessIndexLoaded(this.happinessIndexList);

  List<Object> get props => [happinessIndexList];
}

class HappinessIndexError extends HappinessIndexState {
  final String message;
  HappinessIndexError(this.message);
  List<Object> get props => [message];
}
