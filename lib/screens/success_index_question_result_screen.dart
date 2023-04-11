import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa_cooperation/blocs/authentication-bloc/authentication_bloc.dart';
import 'package:sa_cooperation/blocs/authentication-bloc/authentication_state.dart';
import 'package:sa_cooperation/blocs/success-index-bloc/success_index.dart';
import 'package:sa_cooperation/blocs/success_index_question_result_bloc/success_index_question_result_bloc.dart';
import 'package:sa_cooperation/blocs/success_index_question_result_bloc/success_index_question_result_event.dart';
import 'package:sa_cooperation/blocs/success_index_question_result_bloc/success_index_question_result_state.dart';
import 'package:sa_cooperation/blocs/success_index_result_bloc/success_index_result.dart';
import 'package:sa_cooperation/models/success_index_question_result.dart';
import 'package:sa_cooperation/models/success_index_result.dart';
import 'package:sa_cooperation/utils/api_util.dart';
import 'package:sa_cooperation/utils/icon_util.dart';
import 'package:sa_cooperation/utils/style.dart';
import 'package:sa_cooperation/widgets/activity_indicator.dart';
import 'package:sa_cooperation/widgets/adaptive_appbar.dart';

class SuccessIndexQuestionResultScreen extends StatefulWidget {
  const SuccessIndexQuestionResultScreen({Key? key}) : super(key: key);

  @override
  State<SuccessIndexQuestionResultScreen> createState() => _SuccessIndexQuestionResultScreenState();
}

class _SuccessIndexQuestionResultScreenState extends State<SuccessIndexQuestionResultScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SuccessIndexQuestionResultBloc>(context).add(FetchSuccessIndexQuestionResultEvent());
    BlocProvider.of<SuccessIndexResultBloc>(context).add(FetchSuccessIndexResultEvent());
  }

  double sliderValue = 50;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const AdaptiveAppBar(null, 'Success Index Result'),
      body: BlocBuilder<SuccessIndexQuestionResultBloc, SuccessIndexQuestionResultState>(
        builder: ((context, state) {
          if (state is SuccessIndexQuestionResultLoading) {
            return const Center(
              child: ActivityIndicator(),
            );
          }

          if (state is SuccessIndexQuestionResultLoaded) {
            List<SuccessIndexQuestionResult> list = state.successIndexQuestionResultList.toList();
            if (state.successIndexQuestionResultList.isEmpty) {
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
                            Container(
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
                                          BlocBuilder<SuccessIndexResultBloc, SuccessIndexResultState>(
                                            builder: (context, state) {
                                              if (state is SuccessIndexLoading) {
                                                return const Center(
                                                  child: ActivityIndicator(),
                                                );
                                              }
                                              if (state is SuccessIndexResultLoaded) {
                                                List<SuccessResult> list = state.successIndexResultList.toList();
                                                double value = 0.0;
                                                list.forEach(
                                                  (element) {
                                                    print(element.sliderValueAverage);
                                                    value += element.sliderValueAverage;
                                                  },
                                                );
                                                return SliderTheme(
                                                  data: SliderTheme.of(context).copyWith(
                                                    activeTrackColor: Style.pColor,
                                                    inactiveTrackColor: Style.pColor,
                                                    trackShape: const RoundedRectSliderTrackShape(),
                                                    trackHeight: 4.0,
                                                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                                                    thumbColor: Style.pColor,
                                                    overlayColor: Style.pColor,
                                                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 28.0),
                                                    tickMarkShape: const RoundSliderTickMarkShape(),
                                                    activeTickMarkColor: Style.pColor,
                                                    inactiveTickMarkColor: Colors.red[100],
                                                    valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                                                    valueIndicatorColor: Style.pColor,
                                                    valueIndicatorTextStyle: const TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  child: Slider(
                                                    value: double.parse(value.toStringAsFixed(2)),
                                                    min: 0,
                                                    max: 100,
                                                    divisions: 10,
                                                    label: value.toString(),
                                                    onChanged: (value) {},
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
                                    child: CircleAvatar(
                                      radius: height * 0.045,
                                      backgroundImage: NetworkImage(
                                        state.user.image != null ? '${ApiUtil.profileImageEndPoint}/${state.user.image}' : avatarNetworkIcon,
                                      ),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: List.generate(
                                list.length,
                                (index) => getCardWidget(width, height, list[index]),
                              ),
                            ),
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
        }),
      ),
    );
  }

  Container getCardWidget(double width, double height, SuccessIndexQuestionResult result) {
    List<Question> questionList = result.questionList!;
    if (questionList.isEmpty) {
      return Container();
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(8),
      width: width * 0.75,
      // height: height * 0.12,
      decoration: const BoxDecoration(
        color: Style.pColor,
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
              successIndexIcon,
              height: 60,
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
