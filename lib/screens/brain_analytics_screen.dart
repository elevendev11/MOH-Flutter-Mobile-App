import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa_cooperation/blocs/authentication-bloc/authentication_bloc.dart';
import 'package:sa_cooperation/blocs/authentication-bloc/authentication_state.dart';
import 'package:sa_cooperation/blocs/evaluation_mind_question_result_bloc/evaluation_mind_question_result.dart';
import 'package:sa_cooperation/blocs/evaluation_mind_result_bloc/question_mind_result.dart';
import 'package:sa_cooperation/models/evaluation_mind_question_result.dart';
import 'package:sa_cooperation/models/evaluation_mind_result.dart';
import 'package:sa_cooperation/utils/api_util.dart';
import 'package:sa_cooperation/utils/icon_util.dart';
import 'package:sa_cooperation/utils/style.dart';
import 'package:sa_cooperation/widgets/activity_indicator.dart';


import '../utils/routes.dart';

class BrainAnalyticsScreen extends StatefulWidget {
  const BrainAnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<BrainAnalyticsScreen> createState() => _BrainAnalyticsScreenState();
}

class _BrainAnalyticsScreenState extends State<BrainAnalyticsScreen> {
  Future<bool> _onWillPop() async {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).popUntil((route) => route.isFirst);
      return false;
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<EvaluationMindQuestionResultBloc>(context)
        .add(FetchEvaluationMindQuestionResultEvent());
    BlocProvider.of<EvaluationMindResultBloc>(context)
        .add(FetchEvaluationMindResultEvent());
  }

  double leftValue = 0.0;
  double rightValue = 0.0;

  List<EvaluationMindQuestionResult> resultList = [];

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Evaluation Mind Result',
          style: TextStyle(color: Colors.white, fontSize: 22),
          textScaleFactor: 1.0,
        ),
        backgroundColor: Style.pColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              homeScreenRoute,
              (route) => route.isFirst,
            );
          },
        ),
      ),
      body: BlocBuilder<EvaluationMindResultBloc, EvaluationMindResultState>(
        builder: (context, state) {
          if (state is EvaluationMindResultLoading) {
            return const Center(
              child: ActivityIndicator(),
            );
          }
          if (state is EvaluationMindResultLoaded) {
            List<EvaluationMindResult> dataList =
                state.evaluationMindResultList;
            if (dataList.isEmpty) {
              return const Center(
                child: Text('No result found'),
              );
            }
            dataList.forEach((element) => {
                  if (element.sectionTitle.toLowerCase().contains("left"))
                    {
                      leftValue = element.sliderValueAverage,
                    },
                  if (element.sectionTitle.toLowerCase().contains("right"))
                    {
                      rightValue = element.sliderValueAverage,
                    },
                });
            print(leftValue);
            print(rightValue);
            return BlocBuilder<EvaluationMindQuestionResultBloc,
                EvaluationMindQuestionResultState>(
              builder: (context, state) {
                if (state is EvaluationMindQuestionResultLoaded) {
                  List<EvaluationMindQuestionResult> list =
                      state.evaluationMindQuestionResultList;
                  if (list.isEmpty) {
                    return const Center(
                      child: Text('No result found'),
                    );
                  }
                  resultList.clear();
                  if (leftValue > rightValue) {
                    list.forEach((element) {
                      if (element.sectionTitle.toLowerCase().contains("left")) {
                        resultList.add(element);
                      }
                    });
                  } else {
                    list.forEach((element) {
                      if (element.sectionTitle
                          .toLowerCase()
                          .contains("right")) {
                        resultList.add(element);
                      }
                    });
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
                            BlocBuilder<AuthenticationBloc,
                                AuthenticationState>(
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
                                                Spacer(),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.pushNamed(
                                                            context,
                                                            happinessBarChartScreenRoute);
                                                      },
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        height: height * 0.06,
                                                        width: width * 0.1,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              blurRadius: 2,
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: Image.asset(
                                                          happinessIcon,
                                                          color: Colors.grey,
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
                                                            const EdgeInsets
                                                                .all(5),
                                                        height: height * 0.06,
                                                        width: width * 0.1,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
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
                                                            const EdgeInsets
                                                                .all(5),
                                                        height: height * 0.06,
                                                        width: width * 0.1,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
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
                                                      onTap: () {},
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        height: height * 0.06,
                                                        width: width * 0.1,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Style.pColor,
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              color:
                                                                  Style.pColor,
                                                              blurRadius: 2,
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: Image.asset(
                                                          knowYourselfIcon,
                                                          color: Colors.white,
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
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: width * 0.8,
                              height: height * 0.3,
                              child: leftValue > rightValue
                                  ? Image.asset(leftBrainIcon)
                                  : Image.asset(rightBrainIcon),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            getBrainCardResult(
                              width,
                              height,
                              leftValue > rightValue
                                  ? Style.pColor
                                  : Colors.orange[800],
                              resultList,
                            ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // getBrainCardResult(width, height, Style.pColor),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return Container();
              },
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget getBrainCardResult(double width, double height, Color? color,
      List<EvaluationMindQuestionResult> list) {
    return Container(
      width: width * 0.7,
      height: height * 0.18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color!,
          width: 1.5,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              height: constraints.maxHeight * 0.25,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    height: constraints.maxHeight * 0.18,
                    width: constraints.maxWidth * 0.26,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        leftValue > rightValue ? "Left Brain" : "Right Brain",
                        textScaleFactor: 0.8,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.white,
              height: 1,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  height: constraints.maxHeight * 0.74,
                  width: constraints.maxWidth * 0.1,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      list.length,
                      (index) => Text(
                        "${index + 1}.",
                        textScaleFactor: 0.9,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.06),
                  width: constraints.maxWidth * 0.9,
                  height: constraints.maxHeight * 0.74,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: List.generate(
                      list.length,
                      (index) => getStatusRow(
                          "${list[index].questionStatement} :",
                          list[index].mindintensity,
                          constraints),
                    ),
                    // children: [

                    //   getStatusRow("Perceptual Speed :", "High", constraints),
                    //   getStatusRow(
                    //       "Spatial Visualization :", "High", constraints),
                    // ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getStatusRow(String key, String value, BoxConstraints constraints) {
    return SizedBox(
      width: constraints.maxWidth * 0.9,
      height: constraints.maxHeight * 0.24,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              key,
              textScaleFactor: 0.9,
            ),
            Text(
              value,
              textScaleFactor: 0.9,
            ),
          ],
        ),
      ),
    );
  }
}
