import 'package:bloc/bloc.dart';
import 'package:sa_cooperation/blocs/success_index_question_result_bloc/success_index_question_result_event.dart';
import 'package:sa_cooperation/blocs/success_index_question_result_bloc/success_index_question_result_state.dart';
import 'package:sa_cooperation/models/success_index_question_result.dart';
import 'package:sa_cooperation/repositories/success_index_repository.dart';

class SuccessIndexQuestionResultBloc extends Bloc<SuccessIndexQuestionResultEvent, SuccessIndexQuestionResultState> {
  final SuccessIndexRepository repository;

  SuccessIndexQuestionResultBloc(this.repository) : super(SuccessIndexQuestionResultInitial()) {
    on<SuccessIndexQuestionResultEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(SuccessIndexQuestionResultEvent event, Emitter<SuccessIndexQuestionResultState> emit) async {
    if (event is FetchSuccessIndexQuestionResultEvent) {
       emit(SuccessIndexQuestionResultLoading());
      try {
        List<SuccessIndexQuestionResult> successIndexQuestionResultList = await repository.findSuccessIndexQuestionResult();
        emit(SuccessIndexQuestionResultLoaded(successIndexQuestionResultList));
      } catch (e) {
        emit(SuccessIndexQuestionResultError(e.toString()));
      }
    }
  }
}
