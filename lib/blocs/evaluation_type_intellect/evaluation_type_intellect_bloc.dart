import 'package:bloc/bloc.dart';
import 'package:sa_cooperation/blocs/evaluation_type_intellect/evaluation_type_intellect.dart';
import 'package:sa_cooperation/models/evaluation_type_intellect.dart';
import 'package:sa_cooperation/repositories/evaluation_type_intellect.dart';

class EvaluationTypeIntellectBloc extends Bloc<EvaluationTypeIntellectEvent, EvaluationTypeIntellectState> {
  final EvaluationTypeIntellectRepository repository;

  EvaluationTypeIntellectBloc(this.repository) : super(EvaluationTypeIntellectInitial()) {
    on<EvaluationTypeIntellectEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(EvaluationTypeIntellectEvent event, Emitter<EvaluationTypeIntellectState> emit) async {
    if (event is FetchEvaluationTypeIntellectEvent) {
      emit(EvaluationTypeIntellectLoading());
      try {
        List<EvaluationTypeIntellect> evaluationTypeIntellectList = await repository.findAllEvaluationTypeIntellect();
        emit(EvaluationTypeIntellectLoaded(evaluationTypeIntellectList));
      } catch (e) {
        emit(EvaluationTypeIntellectError(e.toString()));
      }
    }
  }
}
