import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sa_cooperation/blocs/evaluation_type_intellect/evaluation_type_intellect.dart';
import 'package:sa_cooperation/blocs/transaction-bloc/transaction_state.dart';
import 'package:sa_cooperation/models/evaluation_type_intellect.dart';
import 'package:sa_cooperation/models/evaluation_type_intellect_answer.dart';
import 'package:sa_cooperation/repositories/login_repository.dart';
import 'package:sa_cooperation/utils/icon_util.dart';
import 'package:sa_cooperation/utils/read_more.dart';
import 'package:sa_cooperation/utils/routes.dart';
import 'package:sa_cooperation/utils/style.dart';
import 'package:sa_cooperation/widgets/activity_indicator.dart';
import 'package:sa_cooperation/widgets/adaptive_appbar.dart';
import 'package:sa_cooperation/widgets/information_dialog.dart';

import '../blocs/transaction-bloc/transaction_bloc.dart';
import '../blocs/transaction-bloc/transaction_event.dart';

class EvaluationTypeIntellectScreen extends StatefulWidget {
  const EvaluationTypeIntellectScreen({Key? key}) : super(key: key);

  @override
  State<EvaluationTypeIntellectScreen> createState() =>
      _EvaluationTypeIntellectScreenState();
}

class _EvaluationTypeIntellectScreenState
    extends State<EvaluationTypeIntellectScreen> {
  final sectionController = PageController();
  final questionController = PageController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, dynamic> _requestBody = {};
  List<EvaluationTypeIntellectAnswer> answerList = [];
  bool isLastQuestion = false;
  int questionNumber = 1;


  void validate() {
    if (_formKey.currentState!.validate()) {
      _requestBody['userId'] =
          context.read<LoginRepository>().getLoggedInUser!.id;
      // _requestBody['sectionId'] = widget.sectionId;
      List<Map<String, dynamic>> answerMap = new List.empty(growable: true);
      answerList.forEach((element) {
        answerMap.add(element.toJson());
      });
      _requestBody['answerList'] = answerMap;
      _formKey.currentState!.save();
      context.loaderOverlay.show();
      BlocProvider.of<TransactionBloc>(context)
          .add(SubmitEvaluationTypeIntellect(_requestBody));
    } else {
      print("Not Validated");
    }
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<EvaluationTypeIntellectBloc>(context)
        .add(FetchEvaluationTypeIntellectEvent());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AdaptiveAppBar(
        null,
        "Question $questionNumber",
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: BlocBuilder<EvaluationTypeIntellectBloc,
            EvaluationTypeIntellectState>(
          builder: ((context, state) {
            if (state is EvaluationTypeIntellectLoading) {
              return const Center(
                child: ActivityIndicator(),
              );
            }
            if (state is EvaluationTypeIntellectLoaded) {
              List<EvaluationTypeIntellect> list =
                  state.evaluationTypeIntellectList.toList();
              if (list.isEmpty) {
                return const Center(
                  child: Text('No evaluation intellect found'),
                );
              } else {
                if (list.length == 1) {
                  isLastQuestion = true;
                }
                return getSectionWidget(
                  questionList: list,
                  height: height,
                  width: width,
                );
              }
            }
            return Container();
          }),
        ),
      ),
    );
  }

  Widget getSectionWidget(
      {required List<EvaluationTypeIntellect> questionList,
      required double height,
      required double width}) {
    return Container(
      height: height * 0.95,
      width: width * 1,
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
      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  HeaderWidget(
                    constraints: constraints,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.53,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.17),
                    child: PageView.builder(
                      controller: questionController,
                      itemCount: questionList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        // questionIndex = index;
                        var answer = EvaluationTypeIntellectAnswer(
                            sectionId: questionList[index].sectionId);
                        answer.oidQuestion = questionList[index].questionId;
                        return BodyWidget(
                          constraints: constraints,
                          question: questionList[index],
                          answer: answer,
                          answerList: answerList,
                        );
                      },
                    ),
                  ),
                  FooterWidget(
                    constraints: constraints,
                    sectionController: sectionController,
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      questionController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeIn,
                      );
                      if (questionController.page! + 1 <= questionList.length) {
                        setState(() {
                          questionNumber += 1;
                        });
                      }
                      if (questionController.page!.toInt() ==
                          questionList.length - 2) {
                        print("submit");
                        setState(() {
                          isLastQuestion = true;
                        });
                      }
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontSize: 18,
                      ),
                    ),
                  ),
                  if (!isLastQuestion)
                    IconButton(
                      onPressed: () {
                        print(questionController.page);
                        questionController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeIn,
                        );
                        if (questionController.page! + 1 <=
                            questionList.length) {
                          setState(() {
                            questionNumber += 1;
                          });
                        }
                        if (questionController.page!.toInt() ==
                            questionList.length - 2) {
                          print("submit");
                          setState(() {
                            isLastQuestion = true;
                          });
                        }
                      },
                      icon: Image.asset(
                        nextButtonIcon,
                        height: 35,
                      ),
                    ),
                  if (isLastQuestion)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ElevatedButton(
                        onPressed: validate,
                        style: ElevatedButton.styleFrom(
                          primary: Style.pColor,
                        ),
                        child: const Text(
                          "Submit",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  final BoxConstraints constraints;
  const HeaderWidget({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      height: constraints.maxHeight * 0.21,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                "Module",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Text(
                "Evaluation\nIntellect",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
                textAlign: TextAlign.end,
              ),
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            height: constraints.maxHeight * 0.1,
            child: Image.asset(personalEvaluationIcon),
          ),
        ],
      ),
    );
  }
}

class FooterWidget extends StatefulWidget {
  final PageController sectionController;
  final BoxConstraints constraints;
  const FooterWidget({
    Key? key,
    required this.constraints,
    required this.sectionController,
  }) : super(key: key);

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: widget.constraints.maxWidth * 0.1,
        vertical: 10,
      ),
      height: widget.constraints.maxHeight * 0.248,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //_builSliderRange(),
          FittedBox(
            child: Row(
              children: [
                Image.asset(
                  infoPurpleIcon,
                  height: 20,
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  "Your answers will remain completely\nconfidential.",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BodyWidget extends StatefulWidget {
  final BoxConstraints constraints;
  final EvaluationTypeIntellect question;
  final EvaluationTypeIntellectAnswer answer;
  final List<EvaluationTypeIntellectAnswer> answerList;
  const BodyWidget({
    Key? key,
    required this.constraints,
    required this.question,
    required this.answer,
    required this.answerList,
  }) : super(key: key);

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  double sliderValue = 0.0;
  @override
  void initState() {
    sliderValue = sliderValue;
    widget.answer.sliderValue = sliderValue;
    widget.answerList.add(widget.answer);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      // height: widget.constraints.maxHeight * 0.46,
      // width: widget.constraints.maxWidth * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: LoaderOverlay(
        overlayWidget: const ActivityIndicator(),
        child: BlocListener<TransactionBloc, TransactionState>(
          listener: (context, state) {
            if (state is TransactionSuccess) {
              context.loaderOverlay.hide();
              Navigator.pushNamed(
                  context, evaluationTypeIntellectResultScreenRoute);
            } else if (state is TransactionError) {
              context.loaderOverlay.hide();
            }
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        widget.question.fullSectionIntellectName,
                        textScaleFactor: 1.0,
                        style: const TextStyle(
                          color: Style.pColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        getInformationDialog(context);
                      },
                      icon: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset(
                          infoPurpleIcon,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: widget.constraints.maxHeight * 0.09,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        widget.question.questionStatement,
                        textScaleFactor: 0.9,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slider(
                  min: 0.0,
                  max: 10.0,
                  value: sliderValue,
                  divisions: 10,
                  label: sliderValue.round().toString(),
                  onChanged: (d) {
                    setState(() {
                      sliderValue = d;
                      widget.answer.sliderValue = sliderValue;
                    });
                    widget.answerList.removeWhere((element) =>
                        element.oidQuestion == widget.answer.oidQuestion);
                    widget.answerList.add(widget.answer);
                  },
                  thumbColor: Style.pColor,
                  activeColor: Style.pColor,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Your last score was ${widget.question.lastsliderValue != null ? widget.question.lastsliderValue : 'N/A'}",
                  textScaleFactor: 0.9,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Style.pColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  width: widget.constraints.maxWidth * 0.4,
                  height: widget.constraints.maxHeight * 0.08,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        "Note: This question is related to intellect",
                        textScaleFactor: 0.7,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
