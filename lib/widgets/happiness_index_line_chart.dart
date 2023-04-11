import 'package:flutter/material.dart';
import 'package:sa_cooperation/models/happiness_index_line_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HappinessIndexLineChartWidget extends StatefulWidget {
  const HappinessIndexLineChartWidget({super.key, required this.barValues});

  final List<HappinessIndexLineChart> barValues;

  @override
  State<HappinessIndexLineChartWidget> createState() => _HappinessIndexLineChartWidgetState();
}

class _HappinessIndexLineChartWidgetState extends State<HappinessIndexLineChartWidget> {
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
        series: <ChartSeries<HappinessIndexLineChart, String>>[
          // Renders line chart
          LineSeries<HappinessIndexLineChart, String>(
            dataSource: widget.barValues,
            xValueMapper: (HappinessIndexLineChart data, _) => "${data.createdAt.day} ${getMonth(data.createdAt.month)}",
            yValueMapper: (HappinessIndexLineChart data, _) => data.sliderValueAverage,
            markerSettings: const MarkerSettings(isVisible: true),
          ),
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
  }
}

class ChartData {
  final DateTime dateTime;
  final double y;

  ChartData(this.dateTime, this.y);
}
