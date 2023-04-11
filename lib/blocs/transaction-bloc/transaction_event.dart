import 'package:equatable/equatable.dart';

abstract class TransactionEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateUser extends TransactionEvent {
  final Map<String, dynamic> requestBody;
  CreateUser(this.requestBody);
}

class UpdateUser extends TransactionEvent {
  final Map<String, dynamic> requestBody;
  UpdateUser(this.requestBody);
}

class CreateAssesmentRequest extends TransactionEvent {
  final Map<String, dynamic> requestBody;
  CreateAssesmentRequest(this.requestBody);
}

class SubmitSuccessIndex extends TransactionEvent {
  final Map<String, dynamic> requestBody;
  SubmitSuccessIndex(this.requestBody);
}

class SubmitHappinessIndex extends TransactionEvent {
  final Map<String, dynamic> requestBody;
  SubmitHappinessIndex(this.requestBody);
}

class SubmitEvaluationTypeIntellect extends TransactionEvent {
  final Map<String, dynamic> requestBody;
  SubmitEvaluationTypeIntellect(this.requestBody);
}

class SubmitEvaluationTypeMind extends TransactionEvent {
  final Map<String, dynamic> requestBody;
  SubmitEvaluationTypeMind(this.requestBody);
}
