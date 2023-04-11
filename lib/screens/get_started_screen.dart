import 'package:flutter/material.dart';
import 'package:sa_cooperation/utils/icon_util.dart';
import 'package:sa_cooperation/utils/routes.dart';
import 'package:sa_cooperation/utils/style.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.pColor,
        title: const Text(
          "Let's Start",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            backButtonIcon,
            height: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              width: width,
              height: height * 0.13,
              child: const Center(
                child: Text(
                  "Ready To Change The Way You Feel?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              width: width,
              height: height * 0.23,
              child: Image.asset(
                readyToGetIcon,
                height: height * 0.23,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 10,
              ),
              width: width,
              height: height * 0.2,
              child: const Center(
                child: Text(
                  "This content is related to app. This content is related to app. This content is related to app. This content is related to app.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              width: width,
              height: height * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: StartingOptionWidget(
                          width: width,
                          height: height,
                          assetName: happinessIcon,
                          isEven: false,
                          label: "Happiness Index",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: StartingOptionWidget(
                          width: width,
                          height: height,
                          assetName: successIndexIcon,
                          isEven: true,
                          label: "Success Index",
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: StartingOptionWidget(
                          width: width,
                          height: height,
                          assetName: personalEvaluationIcon,
                          isEven: true,
                          label: "Evaluation Of\nType Of Intellect",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: StartingOptionWidget(
                          width: width,
                          height: height,
                          assetName: knowYourselfIcon,
                          isEven: false,
                          label: "Evaluation Of\nType Of Mind",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: width,
              height: height * 0.1,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.23,
                  vertical: height * 0.015,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, signupScreenRoute);
                  },
                  child: Text(
                    "Get Started Today",
                    textScaleFactor: 1.1,
                    style: const TextStyle(
                      color: Colors.white,
                      // fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Style.pColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StartingOptionWidget extends StatelessWidget {
  const StartingOptionWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.isEven,
    required this.assetName,
    required this.label,
  }) : super(key: key);

  final double width;
  final double height;
  final bool isEven;
  final String assetName, label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          height: width * 0.23,
          width: width * 0.23,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: isEven ? const Color.fromRGBO(255, 102, 0, 1) : Style.pColor,
            ),
            color: isEven ? Style.pColor : const Color.fromRGBO(255, 102, 0, 1),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: Image.asset(assetName),
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
