import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:syncfusion_flutter_charts/charts.dart';


import '../models/success_index_line_chart.dart';

class SuccessIndexLineChartWidget extends StatefulWidget {
  const SuccessIndexLineChartWidget({super.key, required this.barValues});

  final List<SuccessIndexLineChart> barValues;

  @override
  State<SuccessIndexLineChartWidget> createState() =>
      _SuccessIndexLineChartWidgetState();
}

class _SuccessIndexLineChartWidgetState
    extends State<SuccessIndexLineChartWidget> {
  List<Color> gradientColors = [
    Colors.orange,
    Colors.orange,
    Colors.white,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(
            width: 0.0,
          ),


        ),
        primaryYAxis: NumericAxis(
          maximum: 10,
          minimum: 0,
          majorGridLines: const MajorGridLines(
            width: 0.0,
          ),
        ),
        series: <ChartSeries<SuccessIndexLineChart, String>>[
          // Renders line chart
          LineSeries<SuccessIndexLineChart, String>(
            dataSource: widget.barValues,
            // xValueMapper: (SuccessIndexLineChart data, _) => "${data.createdAt.day} ${getMonth(data.createdAt.month)}",
        xValueMapper: (SuccessIndexLineChart data, _) {
              final formattedCreatedAt = formatCreatedAt(data.createdAt);
              return formattedCreatedAt;
            },
            // xValueMapper: (SuccessIndexLineChart data, _) {
            //   final dateTime = data.createdAt;
            //   final monthName = DateFormat('MMM dd').format(dateTime);
            //   return monthName;
            // },
            yValueMapper: (SuccessIndexLineChart data, _) =>
                data.sliderValueAverage,
                
            markerSettings: const MarkerSettings(isVisible: true),
            
          )
          // dataLabelSettings: DataLabelSettings(isVisible: true)),
        ],
      ),
      // child: LineChart(
      //   mainData(),
      // ),
    );
  }

  String formatCreatedAt(DateTime createdAt) {
    final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(createdAt);
  }


}

class ChartData {
  final DateTime dateTime;
  final double y;

  ChartData(this.dateTime, this.y);
}
