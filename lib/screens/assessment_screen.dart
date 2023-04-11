import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sa_cooperation/blocs/transaction-bloc/transaction_bloc.dart';
import 'package:sa_cooperation/blocs/transaction-bloc/transaction_event.dart';
import 'package:sa_cooperation/blocs/transaction-bloc/transaction_state.dart';
import 'package:sa_cooperation/models/assesments.dart';
import 'package:sa_cooperation/repositories/login_repository.dart';
import 'package:sa_cooperation/utils/icon_util.dart';
import 'package:sa_cooperation/utils/routes.dart';
import 'package:sa_cooperation/utils/style.dart';
import 'package:sa_cooperation/utils/system_util.dart';
import 'package:sa_cooperation/widgets/activity_indicator.dart';
import 'package:sa_cooperation/widgets/adaptive_appbar.dart';

import '../blocs/assesment_bloc.dart/assesment_bloc.dart';
import '../blocs/assesment_bloc.dart/assesment_event.dart';
import '../blocs/assesment_bloc.dart/assesment_state.dart';
import '../models/answer_response.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({Key? key}) : super(key: key);

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AssesmentBloc>(context).add(FetchAssesmentEvent());
  }

  bool? isActive;
  PageController pageController = PageController(initialPage: 0);
  int pageChanged = 0;
  bool isChecked = false;
  Choice? selectedChoice;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<int, bool> _multiCheckSelectValues = {};
  final Map<String, dynamic> _requestBody = {};
  List<AnswerResponse> answerList = [];

  final textController = TextEditingController();

  void validate() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.loaderOverlay.show();
      BlocProvider.of<TransactionBloc>(context)
          .add(CreateAssesmentRequest(_requestBody));
    } else {
      print("Not Validated");
    }
  }

  bool isValid(Assesment q) {
    if (q.questionTypeId == 1) {
      if (textController.text.isEmpty) {
        SystemUtil.buildErrorSnackbar(context, "Field required.");
        return false;
      }
      AnswerResponse answerResponse = AnswerResponse(
          oidQuestion: q.id,
          oidChoice: selectedChoice?.id,
          textInfo: textController.text,
          userId: context.read<LoginRepository>().getLoggedInUser!.id);
      answerList.add(answerResponse);
      return true;
    } else if (q.questionTypeId == 2) {
      if (selectedChoice == null) {
        SystemUtil.buildErrorSnackbar(context, "Field cannot be empty");
        return false;
      } else {
        AnswerResponse answerResponse = AnswerResponse(
            oidQuestion: q.id,
            oidChoice: selectedChoice!.id,
            textInfo: null,
            userId: context.read<LoginRepository>().getLoggedInUser!.id);
        answerList.add(answerResponse);
        return true;
      }
    } else {
      if (_multiCheckSelectValues.isEmpty) {
        SystemUtil.buildErrorSnackbar(context, "Field cannot be empty");
        return false;
      } else {
        for (int key in _multiCheckSelectValues.keys) {
          AnswerResponse answerResponse = AnswerResponse(
              oidQuestion: q.id,
              oidChoice: key,
              textInfo: null,
              userId: context.read<LoginRepository>().getLoggedInUser!.id);
          answerList.add(answerResponse);
        }
        return true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const AdaptiveAppBar(null, 'Assesment'),
      body: LoaderOverlay(
        overlayWidget: const ActivityIndicator(),
        child: BlocBuilder<AssesmentBloc, AssesmentState>(
          builder: (context, state) {
            if (state is AssesmentLoading) {
              return const Center(
                child: ActivityIndicator(),
              );
            }
            if (state is AssesmentLoaded) {
              List<Assesment> list = state.assesmentList;
              if (list.isEmpty) {
                return const Center(
                  child: Text('No assesment found'),
                );
              }
              return BlocListener<TransactionBloc, TransactionState>(
                listener: (context, state) {
                  if (state is TransactionSuccess) {
                    context.loaderOverlay.hide();
                    SystemUtil.buildSuccessSnackbar(
                      context,
                      state.message,
                    );
                    Navigator.pushNamed(context, homeScreenRoute);
                  } else if (state is TransactionError) {
                    context.loaderOverlay.hide();
                    SystemUtil.buildErrorSnackbar(
                      context,
                      state.message,
                    );
                  }
                },
                child: Form(
                  key: _formKey,
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (index) {
                      setState(() {
                        pageChanged = index;
                      });
                    },
                    controller: pageController,
                    children: list.map((e) {
                      bool isLast = list.indexOf(e) == list.length - 1;
                      return _buildQuestionListItem(e, isLast);
                    }).toList(),
                  ),
                ),
              );
            }
            return const Center(child: ActivityIndicator());
          },
        ),
      ),
    );
  }

  Widget _buildQuestionListItem(Assesment q, bool isLast) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        Container(
          width: width,
          height: height * 0.22,
          color: const Color.fromRGBO(255, 119, 28, 1),
          child: Center(
            child: Text(
              q.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        ...List.generate(
          q.questionTypeId == 1 ? 1 : q.choiceList.length,
          (index) {
            if (q.questionTypeId == 1) {
              return _buildTextField();
            } else if (q.questionTypeId == 2) {
              return _buildSingleChoiceListItem(q, q.choiceList[index]);
            } else {
              return _buildMultiChoiceListItem(q, q.choiceList[index]);
            }
          },
        ),
        // ListView.builder(
        //   itemCount: q.questionTypeId == 1 ? 1 : q.choiceList.length,
        //   padding: EdgeInsets.zero,
        //   physics: const NeverScrollableScrollPhysics(),
        //   shrinkWrap: true,
        //   itemBuilder: (context, index) {
        //     if (q.questionTypeId == 1) {
        //       return _buildTextField();
        //     } else if (q.questionTypeId == 2) {
        //       return _buildSingleChoiceListItem(q, q.choiceList[index]);
        //     } else {
        //       return _buildMultiChoiceListItem(q, q.choiceList[index]);
        //     }
        //   },
        // ),
        Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.orange[700],
              elevation: 0.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
            ),
            child: Text(
              isLast ? 'Submit' : 'Next',
              textScaleFactor: 1,
              style: Style.bodyText1.copyWith(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              if (pageChanged != q.title.length) {
                if (isValid(q)) {
                  selectedChoice = null;
                  _multiCheckSelectValues.clear();
                  List<Map<String, dynamic>> answerMap =
                      List.empty(growable: true);
                  answerList.forEach((element) {
                    answerMap.add(element.toJson());
                  });
                  _requestBody['answerList'] = answerMap;
                  print(answerMap);

                  if (isLast) {
                    validate();
                  } else {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut);
                  }
                }
              }
            },
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          height: height * 0.08,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                infoPurpleIcon,
                height: 18,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                "Your answers will remain completely\nconfidential.",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: height * 0.015,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildMultiChoiceListItem(Assesment q, Choice c) {
    // bool _value = false;
    return CheckboxListTile(
      title: Text(
        c.choiceStatement,
        textScaleFactor: 1.0,
      ),
      controlAffinity: ListTileControlAffinity.leading,
      autofocus: false,
      activeColor: Colors.green,
      checkColor: Colors.white,
      // selected: _value,
      value: _multiCheckSelectValues[c.id] ?? false,
      onChanged: (bool? value) {
        setState(
          () {
            value!
                ? _multiCheckSelectValues[c.id] = value
                : _multiCheckSelectValues.remove(c.id);
          },
        );
      },
    );
  }

  Widget _buildTextField() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        controller: textController,
        cursorColor: Style.textSecondaryColor.withOpacity(0.2),
        cursorWidth: 1,
        autocorrect: true,
        onSaved: (value) {
          _requestBody['email'] = value;
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Field is required';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildSingleChoiceListItem(Assesment q, Choice c) {
    return RadioListTile(
      title: Text(
        c.choiceStatement,
        textScaleFactor: 1.0,
      ),
      value: c,
      activeColor: Style.primaryColor,
      groupValue: selectedChoice,
      onChanged: (Choice? value) {
        setState(() {
          selectedChoice = value!;
        });
      },
    );
  }
}
