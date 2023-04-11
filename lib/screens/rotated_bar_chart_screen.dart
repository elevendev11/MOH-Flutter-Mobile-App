import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa_cooperation/blocs/authentication-bloc/authentication_bloc.dart';
import 'package:sa_cooperation/blocs/authentication-bloc/authentication_state.dart';
import 'package:sa_cooperation/blocs/evaluation_type_intellect_bloc/evaluation_type_intellect_result.dart';
import 'package:sa_cooperation/models/evaluation_type_intellect_result.dart';
import 'package:sa_cooperation/utils/api_util.dart';
import 'package:sa_cooperation/utils/icon_util.dart';
import 'package:sa_cooperation/utils/style.dart';
import 'package:sa_cooperation/widgets/activity_indicator.dart';
import 'package:sa_cooperation/widgets/adaptive_appbar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../utils/routes.dart';

class RotatedBarChartScreen extends StatefulWidget {
  const RotatedBarChartScreen({Key? key}) : super(key: key);

  @override
  State<RotatedBarChartScreen> createState() => _RotatedBarChartScreenState();
}

class _RotatedBarChartScreenState extends State<RotatedBarChartScreen> {
  final List<ChartData> chartData = [
    ChartData(2, "Turbulent", "Absent"),
    ChartData(8, "Judging", "Judging"),
    ChartData(6, "Ethinicity", "Feeling"),
    ChartData(3, "Sensitivity", "Intensivity"),
    ChartData(9, "Extrovert", "Introvert"),
  ];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<EvaluationTypeIntellectResultBloc>(context).add(FetchEvaluationTypeIntellectResultEvent());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Style.pColor,
      //   title: const Text(
      //     "Evaluation Type Intellect",
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 22,
      //     ),
      //   ),
      //   centerTitle: false,
      //   leading: IconButton(
      //     onPressed: () {},
      //     icon: Image.asset(
      //       menuIcon,
      //       height: 25,
      //     ),
      //   ),
      // ),
      appBar: const AdaptiveAppBar(null, 'Evaluation Intellet History'),
      body: BlocBuilder<EvaluationTypeIntellectResultBloc, EvaluationTypeIntellectResultState>(
        builder: (context, state) {
          if (state is EvaluationTypeIntellectResultLoading) {
            return const Center(
              child: ActivityIndicator(),
            );
          }
          if (state is EvaluationTypeIntellectResultLoaded) {
            List<EvaluationTypeIntellectResult> list = state.evaluationTypeIntellectResultList.toList();
            if (list.isEmpty) {
              return const Center(
                child: Text('No result found'),
              );
            }
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    tileMode: TileMode.clamp,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(252, 129, 48, 1),
                      Colors.white,
                    ],
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      tileMode: TileMode.clamp,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Colors.white,
                        // Colors.transparent,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Result",
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "This content is related to your result",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        builder: (context, state) {
                          if (state is AuthenticationAuthenticated) {
                            return Container(
                              width: width * 0.8,
                              height: height * 0.3,
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      width: width * 0.8,
                                      height: height * 0.25,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          tileMode: TileMode.clamp,
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.grey[200]!,
                                            Colors.white,
                                            // Colors.transparent,
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      padding: const EdgeInsets.only(
                                        top: 32,
                                        right: 15,
                                        left: 15,
                                        bottom: 15,
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            state.user.name,
                                            style: TextStyle(
                                              color: Colors.grey[800],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            "This content is related to app. This content is related to app. This content is related to app.",
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 12,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              InkWell(
                                                hoverColor: Colors.red,
                                                onTap: () {
                                                  Navigator.pushNamed(context, happinessBarChartScreenRoute);
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets.all(5),
                                                  height: height * 0.06,
                                                  width: width * 0.1,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 2,
                                                      )
                                                    ],
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: Image.asset(
                                                    happinessIcon,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pushNamed(context, successBarChartScreenRoute);
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets.all(5),
                                                  height: height * 0.06,
                                                  width: width * 0.1,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 2,
                                                      )
                                                    ],
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: Image.asset(
                                                    successIndexIcon,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  padding: const EdgeInsets.all(5),
                                                  height: height * 0.06,
                                                  width: width * 0.1,
                                                  decoration: BoxDecoration(
                                                    color: Color.fromRGBO(255, 102, 0, 1),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Color.fromRGBO(255, 102, 0, 1),
                                                        blurRadius: 2,
                                                      )
                                                    ],
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: Image.asset(
                                                    personalEvaluationIcon,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pushNamed(context, brainAnalyticsScreenRoute);
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets.all(5),
                                                  height: height * 0.06,
                                                  width: width * 0.1,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 2,
                                                      )
                                                    ],
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: Image.asset(
                                                    knowYourselfIcon,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    left: 0,
                                    child: CircleAvatar(
                                      radius: height * 0.045,
                                      backgroundImage: NetworkImage('${ApiUtil.profileImageEndPoint}/${state.user.image}'),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                      Container(
                        width: width * 0.8,
                        height: height * 0.6,
                        decoration: BoxDecoration(),
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: SfCartesianChart(
                            enableSideBySideSeriesPlacement: false,
                            axes: <ChartAxis>[
                              CategoryAxis(
                                name: 'xAxis',
                                opposedPosition: true,
                                majorGridLines: const MajorGridLines(
                                  width: 0.0,
                                ),
                              ),
                            ],
                            primaryXAxis: CategoryAxis(
                              majorGridLines: const MajorGridLines(
                                width: 0.0,
                              ),
                            ),
                            primaryYAxis: NumericAxis(
                              opposedPosition: true,
                              majorGridLines: const MajorGridLines(
                                width: 0.0,
                              ),
                            ),
                            series: <ChartSeries<EvaluationTypeIntellectResult, String>>[
                              // Renders line chart
                              ColumnSeries<EvaluationTypeIntellectResult, String>(
                                dataSource: list,
                                xValueMapper: (EvaluationTypeIntellectResult data, _) => data.sectionTitle,
                                yValueMapper: (EvaluationTypeIntellectResult data, _) => data.sliderValueAverage,
                                // splineType: SplineType.natural,
                                color: Colors.orange,
                                width: 0.2,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              ColumnSeries<EvaluationTypeIntellectResult, String>(
                                dataSource: list,
                                xValueMapper: (EvaluationTypeIntellectResult data, _) => data.sectionOpposite,
                                yValueMapper: (EvaluationTypeIntellectResult data, _) => data.sliderValueAverage,
                                // splineType: SplineType.natural,
                                color: Colors.pink,
                                xAxisName: 'xAxis',
                                width: 0.2,
                                opacity: 0.0,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class ChartData {
  final int x;
  final String y1, y2;

  ChartData(this.x, this.y1, this.y2);
}
