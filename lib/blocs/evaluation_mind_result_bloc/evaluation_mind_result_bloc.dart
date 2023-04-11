import 'package:bloc/bloc.dart';
import 'package:sa_cooperation/blocs/evaluation_mind_result_bloc/question_mind_result.dart';
import 'package:sa_cooperation/models/evaluation_mind_result.dart';
import 'package:sa_cooperation/repositories/evaluation_type_mind_repository.dart';

class EvaluationMindResultBloc extends Bloc<EvaluationMindResultEvent, EvaluationMindResultState> {
  final EvaluationTypeMindRepository repository;

  EvaluationMindResultBloc(this.repository) : super(EvaluationMindResultInitial()) {
    on<EvaluationMindResultEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(EvaluationMindResultEvent event, Emitter<EvaluationMindResultState> emit) async {
    if (event is FetchEvaluationMindResultEvent) {
      emit(EvaluationMindResultLoading());
      try {
        List<EvaluationMindResult> evaluationMindResult = await repository.findAllEvaluationMindResult();
        emit(EvaluationMindResultLoaded(evaluationMindResult));
      } catch (e) {
        emit(EvaluationMindResultError(e.toString()));
      }
    }
  }
}
