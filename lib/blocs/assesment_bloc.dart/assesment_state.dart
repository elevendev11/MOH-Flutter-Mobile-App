import 'package:equatable/equatable.dart';
import 'package:sa_cooperation/models/assesments.dart';

abstract class AssesmentState extends Equatable {
  @override
  List<Object> get props => [];
}

class AssesmentInitial extends AssesmentState {}

class AssesmentLoading extends AssesmentState {}

class AssesmentLoaded extends AssesmentState {
  final List<Assesment> assesmentList;
  AssesmentLoaded(this.assesmentList);

  List<Object> get props => [assesmentList];
}

class AssesmentError extends AssesmentState {
  final String message;
  AssesmentError(this.message);
  List<Object> get props => [message];
}

class CreateAssesmentLoading extends AssesmentState {}

class CreateAssesmentSuccess extends AssesmentState {
  final String message;
  CreateAssesmentSuccess(this.message);
  List<Object> get props => [message];
}

class CreateAssesmentError extends AssesmentState {
  final String message;
  CreateAssesmentError(this.message);
}
