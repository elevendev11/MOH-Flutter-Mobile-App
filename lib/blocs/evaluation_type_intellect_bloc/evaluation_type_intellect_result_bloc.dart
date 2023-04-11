import 'package:bloc/bloc.dart';
import 'package:sa_cooperation/blocs/evaluation_type_intellect_bloc/evaluation_type_intellect_result.dart';
import 'package:sa_cooperation/models/evaluation_type_intellect_result.dart';
import 'package:sa_cooperation/repositories/evaluation_type_intellect.dart';

class EvaluationTypeIntellectResultBloc extends Bloc<EvaluationTypeIntellectResultEvent, EvaluationTypeIntellectResultState> {
  final EvaluationTypeIntellectRepository repository;

  EvaluationTypeIntellectResultBloc(this.repository) : super(EvaluationTypeIntellectResultInitial()) {
    on<EvaluationTypeIntellectResultEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(EvaluationTypeIntellectResultEvent event, Emitter<EvaluationTypeIntellectResultState> emit) async {
    if (event is FetchEvaluationTypeIntellectResultEvent) {
      emit(EvaluationTypeIntellectResultLoading());
      try {
        List<EvaluationTypeIntellectResult> evaluationTypeIntellectResultList = await repository.findAllEvaluationTypeIntellectResult();
        emit(EvaluationTypeIntellectResultLoaded(evaluationTypeIntellectResultList));
      } catch (e) {
        emit(EvaluationTypeIntellectResultError(e.toString()));
      }
    }
  }
}
