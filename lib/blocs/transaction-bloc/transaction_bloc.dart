import 'package:bloc/bloc.dart';
import 'package:sa_cooperation/blocs/transaction-bloc/transaction_state.dart';
import 'package:sa_cooperation/repositories/assesment_repository.dart';
import 'package:sa_cooperation/repositories/evaluation_type_intellect.dart';
import 'package:sa_cooperation/repositories/evaluation_type_mind_repository.dart';
import 'package:sa_cooperation/repositories/happiness_index_repository.dart';
import 'package:sa_cooperation/repositories/success_index_repository.dart';
import 'package:sa_cooperation/repositories/user_repository.dart';

import 'transaction_event.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final UserRepository userRpository;
  final SuccessIndexRepository successIndexRepository;
  final HappinessIndexRepository happinessIndexRepository;
  final EvaluationTypeIntellectRepository evaluationTypeIntellectRepository;
  final EvaluationTypeMindRepository evaluationTypeMindRepository;
  final AssesmentRepository assesmentRepository;
  TransactionBloc(
      this.userRpository,
      this.successIndexRepository,
      this.happinessIndexRepository,
      this.assesmentRepository,
      this.evaluationTypeIntellectRepository,
      this.evaluationTypeMindRepository)
      : super(TransactionInitial()) {
    on<TransactionEvent>(_mapEventToState);
  }
  Future<void> _mapEventToState(
      TransactionEvent event, Emitter<TransactionState> emit) async {
    try {
      String _message = '';
      emit(TransactionInProgress());
      if (event is CreateUser) {
        var response = await userRpository.createUser(event.requestBody);
        if (response == 'Email already exists') {
          _message = 'Email already exists';
        } else {
          _message = 'User Created';
        }
      }
      if (event is CreateAssesmentRequest) {
        await assesmentRepository.createAssesmentRequest(event.requestBody);
        _message = 'Assesment Submitted';
      }
      if (event is SubmitSuccessIndex) {
        await successIndexRepository.submitSuccessIndex(event.requestBody);
        _message = 'Success Index Submitted';
      }
      if (event is SubmitHappinessIndex) {
        await happinessIndexRepository.submitHappinessIndex(event.requestBody);
        _message = 'Happiness Index Submitted';
      }
      if (event is SubmitEvaluationTypeIntellect) {
        await evaluationTypeIntellectRepository
            .submitEvaluationTypeIntellect(event.requestBody);
        _message = 'Evaluation Type Intellect Submitted';
      }
      if (event is SubmitEvaluationTypeMind) {
        await evaluationTypeMindRepository
            .submitEvaluationTypeMind(event.requestBody);
        _message = 'Evaluation Type Mind Submitted';
      }
      if (event is UpdateUser) {
        await userRpository.updateUser(event.requestBody);
        _message = 'User Profile Updated';
      }
      emit(TransactionSuccess(_message));
    } catch (e) {
      emit(TransactionError(e.toString()));
    }
  }
}
