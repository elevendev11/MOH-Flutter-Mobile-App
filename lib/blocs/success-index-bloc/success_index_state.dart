import 'package:equatable/equatable.dart';
import 'package:sa_cooperation/models/success_index.dart';

abstract class SuccessIndexState extends Equatable {
  @override
  List<Object> get props => [];
}

class SuccessIndexInitial extends SuccessIndexState {}

class SuccessIndexLoading extends SuccessIndexState {}

class SuccessIndexLoaded extends SuccessIndexState {
  final List<SuccessIndex> successIndexList;
  SuccessIndexLoaded(this.successIndexList);

  List<Object> get props => [successIndexList];
}

class SuccessIndexError extends SuccessIndexState {
  final String message;
  SuccessIndexError(this.message);
  List<Object> get props => [message];
}

