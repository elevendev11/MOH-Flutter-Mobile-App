import 'package:equatable/equatable.dart';
import 'package:sa_cooperation/models/success_index_line_chart.dart';

abstract class SuccessIndexLineChartState extends Equatable {
  @override
  List<Object> get props => [];
}

class SuccessIndexLineChartInitial extends SuccessIndexLineChartState {}

class SuccessIndexLineChartLoading extends SuccessIndexLineChartState {}

class SuccessIndexLineChartLoaded extends SuccessIndexLineChartState {
  final List<SuccessIndexLineChart> successIndexLineChartList;
  SuccessIndexLineChartLoaded(this.successIndexLineChartList);

  List<Object> get props => [successIndexLineChartList];
}

class SuccessIndexLineChartError extends SuccessIndexLineChartState {
  final String message;
  SuccessIndexLineChartError(this.message);
  List<Object> get props => [message];
}
