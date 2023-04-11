import 'package:equatable/equatable.dart';
import 'package:sa_cooperation/models/happiness_index_line_chart.dart';

abstract class HappinessIndexLineChartState extends Equatable {
  @override
  List<Object> get props => [];
}

class HappinessIndexLineChartInitial extends HappinessIndexLineChartState {}

class HappinessIndexLineChartLoading extends HappinessIndexLineChartState {}

class HappinessIndexLineChartLoaded extends HappinessIndexLineChartState {
  final List<HappinessIndexLineChart> happinessIndexLineChartList;
  HappinessIndexLineChartLoaded(this.happinessIndexLineChartList);

  List<Object> get props => [happinessIndexLineChartList];
}

class HappinessIndexLineChartError extends HappinessIndexLineChartState {
  final String message;
  HappinessIndexLineChartError(this.message);
  List<Object> get props => [message];
}
