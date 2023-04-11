import 'package:bloc/bloc.dart';
import 'package:sa_cooperation/blocs/success-index-bloc/success_index.dart';
import 'package:sa_cooperation/models/success_index.dart';
import 'package:sa_cooperation/repositories/success_index_repository.dart';

class SuccessIndexBloc extends Bloc<SuccessIndexEvent, SuccessIndexState> {
  final SuccessIndexRepository repository;

  SuccessIndexBloc(this.repository) : super(SuccessIndexInitial()) {
    on<SuccessIndexEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(SuccessIndexEvent event, Emitter<SuccessIndexState> emit) async {
    if (event is FetchSuccessIndexEvent) {
      emit(SuccessIndexLoading());
      try {
        List<SuccessIndex> successIndexList = await repository.findAllSuccessIndex();
        emit(SuccessIndexLoaded(successIndexList));
      } catch (e) {
        emit(SuccessIndexError(e.toString()));
      }
    }
  }
}
