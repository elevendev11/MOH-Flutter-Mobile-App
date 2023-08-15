import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sa_cooperation/blocs/happiness_index_line_chart_bloc/happiness_index_line_chart.dart';
import 'package:sa_cooperation/models/happiness_index_line_chart.dart';
import 'package:sa_cooperation/models/user.dart';
import 'package:sa_cooperation/utils/api_util.dart';
import 'package:sa_cooperation/utils/style.dart';
import 'package:sa_cooperation/widgets/activity_indicator.dart';
import 'package:sa_cooperation/widgets/adaptive_appbar.dart';
import 'package:sa_cooperation/widgets/happiness_index_line_chart.dart';


import '../utils/icon_util.dart';
import '../utils/routes.dart';

class HappinessCommulativeHistoryScreen extends StatefulWidget {
  const HappinessCommulativeHistoryScreen({super.key});

  @override
  State<HappinessCommulativeHistoryScreen> createState() =>
      _HappinessCommulativeHistoryScreenState();
}

class _HappinessCommulativeHistoryScreenState
    extends State<HappinessCommulativeHistoryScreen> {


  @override
  void initState() {
    super.initState();
    // BlocProvider.of<HappinessIndexResultBloc>(context).add(FetchHappinessIndexResultEvent());
    BlocProvider.of<HappinessIndexLineChartBloc>(context)
        .add(FetchHappinessIndexLineChartEvent());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: const AdaptiveAppBar(null, 'Commulative History'),
        body: BlocBuilder<HappinessIndexLineChartBloc,
            HappinessIndexLineChartState>(
          builder: (context, state) {
            if (state is HappinessIndexLineChartLoading) {
              return const Center(
                child: ActivityIndicator(),
              );
            }
            if (state is HappinessIndexLineChartLoaded) {
              List<HappinessIndexLineChart> listChart =
                  state.happinessIndexLineChartList.toList();
              if (listChart.isEmpty) {
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
                    padding: const EdgeInsets.symmetric(vertical: 20),
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
                          "Previous Result",
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
                        const SizedBox(height: 10),
                        ValueListenableBuilder<Box<User>>(
                          valueListenable: Hive.box<User>('user').listenable(),
                          builder: (context, box, widget) {
                            if (box.isNotEmpty) {
                              var user = box.getAt(0);
                              if (user != null) {
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
                                            borderRadius:
                                                BorderRadius.circular(15),
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
                                                user.name,
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
                                              const Spacer(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  InkWell(
                                                    hoverColor: Colors.red,
                                                    onTap: () {},
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      height: height * 0.06,
                                                      width: width * 0.1,
                                                      decoration: BoxDecoration(
                                                        color: Style.pColor,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color: Style.pColor,
                                                            blurRadius: 2,
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Image.asset(
                                                        happinessIcon,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.pushNamed(
                                                          context,
                                                          successBarChartScreenRoute);
                                                    },
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
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
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Image.asset(
                                                        successIndexIcon,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.pushNamed(
                                                          context,
                                                          evaluationTypeIntellectResultScreenRoute);
                                                    },
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
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
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Image.asset(
                                                        personalEvaluationIcon,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.pushNamed(
                                                          context,
                                                          brainAnalyticsScreenRoute);
                                                    },
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
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
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
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
                                        child: Container(
                                          height: height * 0.09,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey.shade200,
                                            image: DecorationImage(
                                              image: Image.network(
                                                user.image != null
                                                    ? '${ApiUtil.profileImageEndPoint}/${user.image}'
                                                    : avatarNetworkIcon,
                                                fit: BoxFit.cover,
                                              ).image,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }
                            return Container();
                          },
                        ),

                        // Screenshot(
                        //   controller: screenshotController,
                        //   child: Container(
                        //     width: width * 0.8,
                        //     height: height * 0.6,
                        //     decoration: BoxDecoration(),
                        //     child: HappinessIndexBarChartWidget(barValues: list),
                        //   ),
                        // ),
                        const Divider(),
                        Container(
                          width: width * 0.8,
                          height: height * 0.6,
                          decoration: const BoxDecoration(),
                          child: HappinessIndexLineChartWidget(
                              barValues: listChart),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return Container();
          },
        ));
  }
}
