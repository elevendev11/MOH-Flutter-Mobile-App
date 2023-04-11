import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sa_cooperation/models/success_index_result.dart';
import 'package:sa_cooperation/utils/style.dart';

class SuccessIndexBarChartWidget extends StatefulWidget {
  const SuccessIndexBarChartWidget({super.key, required this.barValues});

  final List<SuccessResult> barValues;

  @override
  State<StatefulWidget> createState() => SuccessIndexBarChartWidgetState();
}

class SuccessIndexBarChartWidgetState extends State<SuccessIndexBarChartWidget> {
  final Color leftBarColor = Colors.orange;
  final Color rightBarColor = Colors.orange;
  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    List<BarChartGroupData> items = [];


    widget.barValues.forEach((element) {
      items.add(makeGroupData(
        widget.barValues.indexOf(element),
        element.sliderValueAverage,
      ));
    });

    rawBarGroups = items;
    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: BarChart(
        BarChartData(
          maxY: 10,
          titlesData: FlTitlesData(
            show: true,
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: bottomTitles,
                reservedSize: 42,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                interval: 1,
                getTitlesWidget: leftTitles,
              ),
            ),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          barGroups: showingBarGroups,
          gridData: FlGridData(show: false),
        ),
      ),
    );
    ;
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == 1) {
      text = '1';
    } else if (value == 2) {
      text = '2';
    } else if (value == 3) {
      text = '3';
    } else if (value == 4) {
      text = '4';
    } else if (value == 5) {
      text = '5';
    } else if (value == 6) {
      text = '6';
    } else if (value == 7) {
      text = '7';
    } else if (value == 8) {
      text = '8';
    } else if (value == 9) {
      text = '9';
    } else if (value == 10) {
      text = '10';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    List<String> titles = [];

    widget.barValues.forEach((element) {
      titles.add(element.sectionTitle);
    });

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 9,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 12, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: leftBarColor,
          width: width,
        ),
      ],
    );
  }
}
