import 'package:bloc/bloc.dart';
import 'package:sa_cooperation/blocs/happiness_index_question_result_bloc/happiness_index_question_result.dart';
import 'package:sa_cooperation/repositories/happiness_index_repository.dart';

import '../../models/happiness_index_question_result.dart';


class HappinessIndexQuestionResultBloc extends Bloc<HappinessIndexQuestionResultEvent, HappinessIndexQuestionResultState> {
  final HappinessIndexRepository repository;

  HappinessIndexQuestionResultBloc(this.repository) : super(HappinessIndexQuestionResultInitial()) {
    on<HappinessIndexQuestionResultEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(HappinessIndexQuestionResultEvent event, Emitter<HappinessIndexQuestionResultState> emit) async {
    if (event is FetchHappinessIndexQuestionResultEvent) {
       emit(HappinessIndexQuestionResultLoading());
      try {
        List<HappinessIndexQuestionResult> happinessIndexQuestionResultList = await repository.findAllHappinessIndexQuestionResult();
        emit(HappinessIndexQuestionResultLoaded(happinessIndexQuestionResultList));
      } catch (e) {
        emit(HappinessIndexQuestionResultError(e.toString()));
      }
    }
  }
}
