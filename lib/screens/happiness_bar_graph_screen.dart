import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa_cooperation/blocs/authentication-bloc/authentication_bloc.dart';
import 'package:sa_cooperation/blocs/authentication-bloc/authentication_state.dart';
import 'package:sa_cooperation/blocs/happiness_index_result_bloc/happiness_index_result.dart';
import 'package:sa_cooperation/models/happiness_index_result.dart';
import 'package:sa_cooperation/utils/api_util.dart';
import 'package:sa_cooperation/utils/routes.dart';
import 'package:sa_cooperation/utils/style.dart';
import 'package:sa_cooperation/widgets/activity_indicator.dart';
import 'package:sa_cooperation/widgets/adaptive_appbar.dart';
import 'package:sa_cooperation/widgets/happiness_index_bar_chart.dart';
import 'package:screenshot/screenshot.dart';

import '../utils/icon_util.dart';

class HappinessBarGraphScreen extends StatefulWidget {
  const HappinessBarGraphScreen({super.key});

  @override
  State<HappinessBarGraphScreen> createState() =>
      _HappinessBarGraphScreenState();
}

class _HappinessBarGraphScreenState extends State<HappinessBarGraphScreen> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HappinessIndexResultBloc>(context)
        .add(FetchHappinessIndexResultEvent());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const AdaptiveAppBar(null, 'Happiness Index History'),
      body: BlocBuilder<HappinessIndexResultBloc, HappinessIndexResultState>(
        builder: (context, state) {
          if (state is HappinessIndexResultLoading) {
            return const Center(
              child: ActivityIndicator(),
            );
          }
          if (state is HappinessIndexResultLoaded) {
            List<HappinessIndexResult> list =
                state.happinessIndexResultList.toList();
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
                                          const Spacer(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              InkWell(
                                                hoverColor: Colors.red,
                                                onTap: () {},
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
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
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Image.asset(
                                                    happinessIcon,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pushNamed(context,
                                                      successBarChartScreenRoute);
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
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
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Image.asset(
                                                    successIndexIcon,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pushNamed(context,
                                                      evaluationTypeIntellectResultScreenRoute);
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
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
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Image.asset(
                                                    personalEvaluationIcon,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pushNamed(context,
                                                      brainAnalyticsScreenRoute);
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
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
                                                        BorderRadius.circular(
                                                            8),
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
                                      backgroundImage: NetworkImage(
                                        state.user.image != null
                                            ? '${ApiUtil.profileImageEndPoint}/${state.user.image}'
                                            : avatarNetworkIcon,
                                      ),
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
                      Screenshot(
                        controller: screenshotController,
                        child: Container(
                          width: width * 0.8,
                          height: height * 0.45,
                          decoration: const BoxDecoration(),
                          child: HappinessIndexBarChartWidget(barValues: list),
                        ),
                      ),
                      BlocBuilder<HappinessIndexResultBloc,
                          HappinessIndexResultState>(builder: (context, state) {
                        if (state is HappinessIndexResultLoading) {
                          return const Center(
                            child: ActivityIndicator(),
                          );
                        }
                        if (state is HappinessIndexResultLoaded) {
                          List<HappinessIndexResult> list =
                              state.happinessIndexResultList.toList();
                          double value = 0.0;
                          double secondLatestRecord = 0.0;
                          for (var element in list) {
                            value += element.latestRecord! / list.length;
                          }
                          for (var element in list) {
                            secondLatestRecord +=
                                element.secondLastRecord! / list.length;
                          }
                          return Container(
                            width: width * 0.6,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 0.5, color: Colors.grey),
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  color: Style.pColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(value.toStringAsFixed(2)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 15,
                                  width: 15,
                                  color: Colors.orange,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                      secondLatestRecord.toStringAsFixed(2)),
                                ),
                              ],
                            ),
                          );
                        }
                        return Container();
                      }),
                      const SizedBox(height: 10),
                      Container(
                        width: width * 0.6,
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.5, color: Colors.grey),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 15,
                              width: 15,
                              color: Style.pColor,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text("Current"),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 15,
                              width: 15,
                              color: Colors.orange,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text("Previous"),
                            ),
                          ],
                        ),
                      ),
                      // Divider(),
                      // Container(
                      //   width: width * 0.8,
                      //   height: height * 0.6,
                      //   decoration: BoxDecoration(),
                      //   child: HappinessIndexLineChartWidget(barValues: listChart),
                      // ),
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
