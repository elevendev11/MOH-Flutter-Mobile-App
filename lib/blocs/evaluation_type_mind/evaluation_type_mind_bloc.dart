import 'package:bloc/bloc.dart';
import 'package:sa_cooperation/blocs/evaluation_type_mind/evaluation_type_mind.dart';
import 'package:sa_cooperation/models/evaluation_type_mind.dart';
import 'package:sa_cooperation/repositories/evaluation_type_mind_repository.dart';

class EvaluationTypeMindBloc extends Bloc<EvaluationTypeMindEvent, EvaluationTypeMindState> {
  final EvaluationTypeMindRepository repository;

  EvaluationTypeMindBloc(this.repository) : super(EvaluationTypeMindInitial()) {
    on<EvaluationTypeMindEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(EvaluationTypeMindEvent event, Emitter<EvaluationTypeMindState> emit) async {
    if (event is FetchEvaluationTypeMindEvent) {
      emit(EvaluationTypeMindLoading());
      try {
        List<EvaluationTypeMind> evaluationTypeMindList = await repository.findAllEvaluationTypeMind();
        emit(EvaluationTypeMindLoaded(evaluationTypeMindList));
      } catch (e) {
        emit(EvaluationTypeMindError(e.toString()));
      }
    }
  }
}
