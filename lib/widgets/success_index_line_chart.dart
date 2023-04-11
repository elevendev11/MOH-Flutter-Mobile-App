import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../models/success_index_line_chart.dart';

class SuccessIndexLineChartWidget extends StatefulWidget {
  const SuccessIndexLineChartWidget({super.key, required this.barValues});

  final List<SuccessIndexLineChart> barValues;

  @override
  State<SuccessIndexLineChartWidget> createState() => _SuccessIndexLineChartWidgetState();
}

class _SuccessIndexLineChartWidgetState extends State<SuccessIndexLineChartWidget> {
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

          // dateFormat: DateFormat.yMMMd(),
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
            xValueMapper: (SuccessIndexLineChart data, _) => "${data.createdAt.day} ${getMonth(data.createdAt.month)}",
            yValueMapper: (SuccessIndexLineChart data, _) => data.sliderValueAverage,
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

  String getMonth(int month) {
    switch (month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return "";
    }

    // return "Nov";
  }
}

class ChartData {
  final DateTime dateTime;
  final double y;

  ChartData(this.dateTime, this.y);
}
