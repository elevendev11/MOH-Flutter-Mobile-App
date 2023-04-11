import 'package:bloc/bloc.dart';
import 'package:sa_cooperation/blocs/happiness_index_result_bloc/happiness_index_result.dart';
import 'package:sa_cooperation/models/happiness_index_result.dart';
import 'package:sa_cooperation/repositories/happiness_index_repository.dart';

class HappinessIndexResultBloc extends Bloc<HappinessIndexResultEvent, HappinessIndexResultState> {
  final HappinessIndexRepository repository;

  HappinessIndexResultBloc(this.repository) : super(HappinessIndexResultInitial()) {
    on<HappinessIndexResultEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(HappinessIndexResultEvent event, Emitter<HappinessIndexResultState> emit) async {
    if (event is FetchHappinessIndexResultEvent) {
      emit(HappinessIndexResultLoading());
      try {
        List<HappinessIndexResult> happinessIndexResultList = await repository.findAllHappinessIndexResult();
        emit(HappinessIndexResultLoaded(happinessIndexResultList));
      } catch (e) {
        emit(HappinessIndexResultError(e.toString()));
      }
    }
  }
}
