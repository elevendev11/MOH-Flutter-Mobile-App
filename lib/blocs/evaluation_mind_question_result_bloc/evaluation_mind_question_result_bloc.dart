import 'package:bloc/bloc.dart';
import 'package:sa_cooperation/blocs/evaluation_mind_question_result_bloc/evaluation_mind_question_result_event.dart';
import 'package:sa_cooperation/blocs/evaluation_mind_question_result_bloc/evaluation_mind_question_result_state.dart';
import 'package:sa_cooperation/models/evaluation_mind_question_result.dart';
import 'package:sa_cooperation/repositories/evaluation_type_mind_repository.dart';

class EvaluationMindQuestionResultBloc extends Bloc<EvaluationMindQuestionResultEvent, EvaluationMindQuestionResultState> {
  final EvaluationTypeMindRepository repository;

  EvaluationMindQuestionResultBloc(this.repository) : super(EvaluationMindQuestionResultInitial()) {
    on<EvaluationMindQuestionResultEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(EvaluationMindQuestionResultEvent event, Emitter<EvaluationMindQuestionResultState> emit) async {
    if (event is FetchEvaluationMindQuestionResultEvent) {
      emit(EvaluationMindQuestionResultLoading());
      try {
        List<EvaluationMindQuestionResult> evaluationMindQuestionResult = await repository.findAllEvaluationMindQuestionResult();
        emit(EvaluationMindQuestionResultLoaded(evaluationMindQuestionResult));
      } catch (e) {
        emit(EvaluationMindQuestionResultError(e.toString()));
      }
    }
  }
}
