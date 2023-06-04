import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:sa_cooperation/utils/routes.dart';
import 'package:sa_cooperation/utils/style.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  int i = 1;
  final pageController = PageController();
  final titles = [
    "Management Of Happiness",
    "Happiness Index",
    "Success Index",
    "Evaluation Of Intellect",
    "Evaluation Of Mind",
  ];
  int titleIndex = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: height * 0.33,
            width: width,
            decoration: const BoxDecoration(
              color: Style.pColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome To",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                Text(
                  titles[titleIndex],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.25),
                  child: AnotherStepper(
                    stepperList: List.generate(
                      4,
                      (index) => StepperData(
                        title: null,
                        subtitle: null,
                        iconWidget: GestureDetector(
                          onTap: () {
                            setState(() {
                              i = index + 1;
                              titleIndex = i;
                            });
                          },
                          child: CircleAvatar(
                            radius: 9,
                            backgroundColor: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                "${index + 1}",
                                textScaleFactor: 0.6,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    stepperDirection: Axis.horizontal,
                    // horizontalStepperHeight: 30,
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                    activeIndex: i - 1,
                    activeBarColor: Colors.white,
                    inActiveBarColor: Colors.grey,
                    verticalGap: 10,
                    // gap: 10.0,
                    barThickness: 1.5,
                    // dotWidget: const CircleAvatar(
                    //   radius: 7,
                    //   backgroundColor: Colors.grey,
                    // ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (pi) {
                if (pi == 1) {
                  print(pi);
                  setState(() {
                    titleIndex = 1;
                  });
                }
              },
              children: [
                PageOne(),
                getPageTwo(width),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getPageTwo(double width) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          "assets/images/w$i.png",
          width: width,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Style.pColor,
                child: IconButton(
                  onPressed: () {
                    if (i > 1) {
                      setState(() {
                        i = i - 1;
                        titleIndex = i;
                      });
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 2.5,
                  color: Style.pColor,
                ),
              ),
              CircleAvatar(
                backgroundColor: Style.pColor,
                child: IconButton(
                  onPressed: () {
                    if (i < 4) {
                      setState(() {
                        i = i + 1;
                        titleIndex = i;
                      });
                    } else {
                      Navigator.pushNamed(context, journeyScreenRoute);
                    }
                  },
                  icon: Icon(
                    i == 4 ? Icons.check : Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Image.asset(
              "assets/images/heart_brain.png",
              width: width * 0.5,
            ),
            AnotherStepper(
              stepperList: [
                StepperData(
                  title: StepperText("Calculate your Happiness and your Success in Objective manner."),
                  subtitle: null,
                  iconWidget: CircleAvatar(
                    radius: 12,
                    backgroundColor: Style.pColor.withOpacity(0.3),
                    child: const CircleAvatar(
                      radius: 5,
                      backgroundColor: Style.pColor,
                    ),
                  ),
                ),
                StepperData(
                  title: StepperText(
                      "Understand and Know your type of Intellect."),
                  subtitle: null,
                  iconWidget: CircleAvatar(
                    radius: 12,
                    backgroundColor: Style.pColor.withOpacity(0.3),
                    child: const CircleAvatar(
                      radius: 5,
                      backgroundColor: Style.pColor,
                    ),
                  ),
                ),
                StepperData(
                  title: StepperText(
                      "Understand and Know your type of Mind."),
                  subtitle: null,
                  iconWidget: CircleAvatar(
                    radius: 12,
                    backgroundColor: Style.pColor.withOpacity(0.3),
                    child: const CircleAvatar(
                      radius: 5,
                      backgroundColor: Style.pColor,
                    ),
                  ),
                ),
              ],
              stepperDirection: Axis.vertical,
              scrollPhysics: const NeverScrollableScrollPhysics(),
              activeIndex: 2,
              activeBarColor: Style.pColor,
              verticalGap: 20,
              barThickness: 1.5,
              // dotWidget: const CircleAvatar(
              //   radius: 12,
              //   backgroundColor: Colors.grey,
              //   child: Icon(
              //     Icons.check,
              //     color: Colors.white,
              //     size: 13,
              //   ),
              // ),
            ),
            // Expanded(
            //   child: Stepper(
            //     steps: const [
            //       Step(
            //         title: Text("Reduces Stress & Negative Thoughts"),
            //         content: Text(""),
            //         state: StepState.complete,
            //       ),
            //       Step(
            //         title: Text("Learn Life-Changing Habits Based on Science"),
            //         content: Text(""),
            //         state: StepState.complete,
            //       ),
            //       Step(
            //         title: Text(
            //             "Build Skills For a Healthy Life with Fun Activities and Games"),
            //         content: Text(""),
            //         state: StepState.complete,
            //       ),
            //     ],
            //     controlsBuilder: (context, details) {
            //       return Row(
            //           // children: <Widget>[
            //           //   Container(
            //           //     child: null,
            //           //   ),
            //           //   Container(
            //           //     child: null,
            //           //   ),
            //           // ], // <Widget>[]
            //           );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class PageTwo extends StatefulWidget {
  PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  int i = 1;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          "assets/images/w$i.png",
          width: width,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Style.pColor,
                child: IconButton(
                  onPressed: () {
                    if (i > 1) {
                      setState(() {
                        i = i - 1;
                      });
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 2.5,
                  color: Style.pColor,
                ),
              ),
              CircleAvatar(
                backgroundColor: Style.pColor,
                child: IconButton(
                  onPressed: () {
                    if (i < 4) {
                      setState(() {
                        i = i + 1;
                      });
                    } else {
                      Navigator.pushNamed(context, journeyScreenRoute);
                    }
                  },
                  icon: Icon(
                    i == 4 ? Icons.check : Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
