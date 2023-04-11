import 'package:equatable/equatable.dart';
import 'package:sa_cooperation/models/success_index_result.dart';

abstract class SuccessIndexResultState extends Equatable {
  @override
  List<Object> get props => [];
}

class SuccessIndexResultInitial extends SuccessIndexResultState {}

class SuccessIndexResultLoading extends SuccessIndexResultState {}

class SuccessIndexResultLoaded extends SuccessIndexResultState {
  final List<SuccessResult> successIndexResultList;
  SuccessIndexResultLoaded(this.successIndexResultList);

  List<Object> get props => [successIndexResultList];
}

class SuccessIndexResultError extends SuccessIndexResultState {
  final String message;
  SuccessIndexResultError(this.message);
  List<Object> get props => [message];
}
