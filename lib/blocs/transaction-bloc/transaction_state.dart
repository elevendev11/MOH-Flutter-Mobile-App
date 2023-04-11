import 'package:equatable/equatable.dart';

abstract class TransactionState extends Equatable {
  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionInProgress extends TransactionState {}

class TransactionSuccess extends TransactionState {
  final String message;
  TransactionSuccess(this.message);
  @override
  List<Object> get props => [message];
}

class TransactionError extends TransactionState {
  final String message;
  TransactionError(this.message);
}
