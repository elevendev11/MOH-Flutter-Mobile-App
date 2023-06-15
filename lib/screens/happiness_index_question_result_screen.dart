import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sa_cooperation/blocs/authentication-bloc/authentication_bloc.dart';
import 'package:sa_cooperation/blocs/authentication-bloc/authentication_state.dart';
import 'package:sa_cooperation/blocs/happiness_index_question_result_bloc/Happiness_index_question_result.dart';
import 'package:sa_cooperation/blocs/happiness_index_result_bloc/happiness_index_result.dart';
import 'package:sa_cooperation/models/happiness_index_question_result.dart';
import 'package:sa_cooperation/models/happiness_index_result.dart';
import 'package:sa_cooperation/models/user.dart';
import 'package:sa_cooperation/utils/api_util.dart';
import 'package:sa_cooperation/utils/icon_util.dart';
import 'package:sa_cooperation/utils/routes.dart';
import 'package:sa_cooperation/utils/style.dart';
import 'package:sa_cooperation/widgets/activity_indicator.dart';
import 'package:sa_cooperation/widgets/adaptive_appbar.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HappinessIndexQuestionResultScreen extends StatefulWidget {
  const HappinessIndexQuestionResultScreen({Key? key}) : super(key: key);

  @override
  State<HappinessIndexQuestionResultScreen> createState() =>
      _HappinessIndexQuestionResultScreenState();
}

class _HappinessIndexQuestionResultScreenState
    extends State<HappinessIndexQuestionResultScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HappinessIndexQuestionResultBloc>(context)
        .add(FetchHappinessIndexQuestionResultEvent());
    BlocProvider.of<HappinessIndexResultBloc>(context)
        .add(FetchHappinessIndexResultEvent());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Happiness Index Result',
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
      body: BlocBuilder<HappinessIndexQuestionResultBloc,
          HappinessIndexQuestionResultState>(
        builder: (context, state) {
          if (state is HappinessIndexQuestionResultLoading) {
            return const Center(
              child: ActivityIndicator(),
            );
          }

          if (state is HappinessIndexQuestionResultLoaded) {
            List<HappinessIndexQuestionResult> list =
                state.happinessIndexQuestionResultList.toList();
            if (state.happinessIndexQuestionResultList.isEmpty) {
              return const Center(
                child: Text('No result found'),
              );
            }

            return BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                if (state is AuthenticationAuthenticated) {
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
                            ValueListenableBuilder<Box<User>>(
                                valueListenable:
                                    Hive.box<User>('user').listenable(),
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
                                                      state.user.name,
                                                      style: TextStyle(
                                                        color: Colors.grey[800],
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    Text(
                                                      "This content is related to app. This content is related to app. This content is related to app.",
                                                      style: TextStyle(
                                                        color: Colors.grey[600],
                                                        fontSize: 12,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    BlocBuilder<
                                                        HappinessIndexResultBloc,
                                                        HappinessIndexResultState>(
                                                      builder:
                                                          (context, state) {
                                                        if (state
                                                            is HappinessIndexResultLoading) {
                                                          return const Center(
                                                            child:
                                                                ActivityIndicator(),
                                                          );
                                                        }
                                                        if (state
                                                            is HappinessIndexResultLoaded) {
                                                          List<HappinessIndexResult>
                                                              list = state
                                                                  .happinessIndexResultList
                                                                  .toList();
                                                          double value = 0.0;
                                                          for (var element
                                                              in list) {
                                                            value += element
                                                                    .latestRecord! /
                                                                list.length;
                                                          }
                                                          return SfSliderTheme(
                                                            data:
                                                                SfSliderThemeData(
                                                                    thumbRadius:
                                                                        18),
                                                            child: SfSlider(
                                                              min: 0.0,
                                                              max: 10.0,
                                                              activeColor:
                                                                  Colors.red,
                                                              thumbIcon:
                                                                  Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Text(
                                                                  value
                                                                      .toStringAsFixed(
                                                                          2),
                                                                  textScaleFactor:
                                                                      0.8,
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                              value: double
                                                                  .parse(value
                                                                      .toStringAsFixed(
                                                                          2)),
                                                              onChanged:
                                                                  (dynamic
                                                                      values) {
                                                                // setState(() {
                                                                //   _value =
                                                                //       values as double;
                                                                // });
                                                              },
                                                            ),
                                                          );
                                                        }
                                                        return Container();
                                                      },
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
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: List.generate(
                                list.length,
                                (index) =>
                                    getCardWidget(width, height, list[index]),
                              ),
                            ),
                            // getCardWidget(width, height),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // getCardWidget(width, height),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // getCardWidget(width, height),
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

  Container getCardWidget(
      double width, double height, HappinessIndexQuestionResult result) {
    List<Question> questionList = result.questionList!;
    if (questionList.isEmpty) {
      return Container();
    }
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 10),
      width: width * 0.75,
      // height: height * 0.12,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 102, 0, 1),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              happinessIcon,
              height: 60,
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  result.sectionTitle,
                  textScaleFactor: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    questionList.length,
                    (index) => Text(
                      questionList[index].questionStatement!,
                      textScaleFactor: 0.7,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ResultChartData {
  final int x, y;

  ResultChartData(this.x, this.y);
}
