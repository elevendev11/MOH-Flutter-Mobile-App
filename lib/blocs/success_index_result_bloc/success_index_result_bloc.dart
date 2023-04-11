import 'package:bloc/bloc.dart';
import 'package:sa_cooperation/blocs/success_index_result_bloc/success_index_result.dart';
import 'package:sa_cooperation/models/success_index_result.dart';
import 'package:sa_cooperation/repositories/success_index_repository.dart';

class SuccessIndexResultBloc extends Bloc<SuccessIndexResultEvent, SuccessIndexResultState> {
  final SuccessIndexRepository repository;

  SuccessIndexResultBloc(this.repository) : super(SuccessIndexResultInitial()) {
    on<SuccessIndexResultEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(SuccessIndexResultEvent event, Emitter<SuccessIndexResultState> emit) async {
    if (event is FetchSuccessIndexResultEvent) {
       emit(SuccessIndexResultLoading());
      try {
        List<SuccessResult> successIndexResultList = await repository.findSuccessIndexResult();
        emit(SuccessIndexResultLoaded(successIndexResultList));
      } catch (e) {
        emit(SuccessIndexResultError(e.toString()));
      }
    }
  }
}
