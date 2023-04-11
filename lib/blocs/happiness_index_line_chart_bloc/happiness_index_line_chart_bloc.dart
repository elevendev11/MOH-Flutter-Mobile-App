import 'package:bloc/bloc.dart';
import 'package:sa_cooperation/blocs/happiness_index_line_chart_bloc/happiness_index_line_chart.dart';
import 'package:sa_cooperation/models/happiness_index_line_chart.dart';
import 'package:sa_cooperation/repositories/happiness_index_repository.dart';

class HappinessIndexLineChartBloc extends Bloc<HappinessIndexLineChartEvent, HappinessIndexLineChartState> {
  final HappinessIndexRepository repository;

  HappinessIndexLineChartBloc(this.repository) : super(HappinessIndexLineChartInitial()) {
    on<HappinessIndexLineChartEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(HappinessIndexLineChartEvent event, Emitter<HappinessIndexLineChartState> emit) async {
    if (event is FetchHappinessIndexLineChartEvent) {
      emit(HappinessIndexLineChartLoading());
      try {
        List<HappinessIndexLineChart> happinessIndexLineChartList = await repository.findAllHappinessIndexLineChartResult();
        emit(HappinessIndexLineChartLoaded(happinessIndexLineChartList));
      } catch (e) {
        emit(HappinessIndexLineChartError(e.toString()));
      }
    }
  }
}
