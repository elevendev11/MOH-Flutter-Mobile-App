import 'package:bloc/bloc.dart';
import 'package:sa_cooperation/blocs/assesment_bloc.dart/assesment_event.dart';
import 'package:sa_cooperation/blocs/assesment_bloc.dart/assesment_state.dart';
import 'package:sa_cooperation/blocs/transaction-bloc/transaction_event.dart';
import 'package:sa_cooperation/models/assesments.dart';
import 'package:sa_cooperation/repositories/assesment_repository.dart';

class AssesmentBloc extends Bloc<AssesmentEvent, AssesmentState> {
  final AssesmentRepository repository;

  AssesmentBloc(this.repository) : super(AssesmentInitial()) {
    on<AssesmentEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(AssesmentEvent event, Emitter<AssesmentState> emit) async {
    if (event is FetchAssesmentEvent) {
      emit(AssesmentLoading());
      try {
        List<Assesment> assesmentList = await repository.findAllAssesment();
        emit(AssesmentLoaded(assesmentList));
      } catch (e) {
        emit(AssesmentError(e.toString()));
      }
    }
    // else if (event is CreateAssesmentRequest) {
    //   emit(CreateAssesmentLoading());
    //   try {
    //     await repository.createAssesmentRequest(event.requestBody);
    //     emit(CreateAssesmentSuccess("Response has been submitted successfully"));
    //   } catch (e) {
    //     emit(CreateAssesmentError(e.toString()));
    //   }
    // }
  }
}
