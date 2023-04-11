import 'package:bloc/bloc.dart';
import 'package:sa_cooperation/blocs/happiness-index-bloc/happiness_index.dart';

import 'package:sa_cooperation/models/happiness_index.dart';
import 'package:sa_cooperation/repositories/happiness_index_repository.dart';


class HappinessIndexBloc extends Bloc<HappinessIndexEvent, HappinessIndexState> {
  final HappinessIndexRepository repository;

  HappinessIndexBloc(this.repository) : super(HappinessIndexInitial()) {
    on<HappinessIndexEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(HappinessIndexEvent event, Emitter<HappinessIndexState> emit) async {
    if (event is FetchHappinessIndexEvent) {
      emit(HappinessIndexLoading());
      try {
        List<HappinessIndex> happinessIndexList = await repository.findAllHappinessIndex();
        emit(HappinessIndexLoaded(happinessIndexList));
      } catch (e) {
        emit(HappinessIndexError(e.toString()));
      }
    } 
  }
}
