import 'package:bloc/bloc.dart';
import 'package:sa_cooperation/blocs/success_index_line_chart_bloc/success_index_line_chart.dart';
import 'package:sa_cooperation/models/success_index_line_chart.dart';
import 'package:sa_cooperation/repositories/success_index_repository.dart';

class SuccessIndexLineChartBloc extends Bloc<SuccessIndexLineChartEvent, SuccessIndexLineChartState> {
  final SuccessIndexRepository repository;

  SuccessIndexLineChartBloc(this.repository) : super(SuccessIndexLineChartInitial()) {
    on<SuccessIndexLineChartEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(SuccessIndexLineChartEvent event, Emitter<SuccessIndexLineChartState> emit) async {
    if (event is FetchSuccessIndexLineChartEvent) {
      emit(SuccessIndexLineChartLoading());
      try {
        List<SuccessIndexLineChart> successIndexLineChartList = await repository.findSuccessIndexLineChartResult();
        emit(SuccessIndexLineChartLoaded(successIndexLineChartList));
      } catch (e) {
        emit(SuccessIndexLineChartError(e.toString()));
      }
    }
  }
}
