import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sa_cooperation/models/user.dart';
import 'package:sa_cooperation/utils/api_util.dart';
import 'package:sa_cooperation/utils/icon_util.dart';
import 'package:sa_cooperation/utils/routes.dart';
import 'package:sa_cooperation/utils/style.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool showDetails = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.pColor,
        title: const Text(
          "History",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: Container(
        width: width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            tileMode: TileMode.clamp,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(211, 211, 246, 2),
              Colors.white,
              Colors.white,
            ],
          ),
        ),
        child: ValueListenableBuilder<Box<User>>(
            valueListenable: Hive.box<User>('user').listenable(),
            builder: (context, box, widget) {
              if (box.isNotEmpty) {
                var user = box.getAt(0);
                if (user != null) {
                  return LayoutBuilder(
                    builder: (context, constraints) => ListView(
                      children: [
                        SizedBox(
                          height: constraints.maxHeight * 0.042,
                        ),
                        Container(
                          height: height * 0.25,
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromRGBO(173, 174, 227, 1),
                                spreadRadius: 6,
                                blurRadius: 10,
                                offset: new Offset(0, -6),
                              ),
                            ],
                            image: DecorationImage(
                              image: Image.network(
                                user.image != null ? '${ApiUtil.profileImageEndPoint}/${user.image}' : avatarNetworkIcon,
                                fit: BoxFit.cover,
                              ).image,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.02,
                        ),
                        Center(
                          child: Text(
                            'Hello ${user.name}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: constraints.maxHeight * 0.03,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            '${user.email}',
                            style: TextStyle(
                              fontSize: constraints.maxHeight * 0.02,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.08,
                        ),
                        Container(
                          width: width,
                          height: height * 0.42,
                          padding: EdgeInsets.symmetric(
                            horizontal: constraints.maxWidth * 0.16,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, happinessHistoryOptionScreenRoute);
                                    },
                                    child: CircularWidget(
                                      assetName: happinessIcon,
                                      color: Style.pColor,
                                      constraints: constraints,
                                      label: "Happiness Index",
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, successHistoryOptionScreenRoute);
                                    },
                                    child: CircularWidget(
                                      assetName: successIndexIcon,
                                      color: const Color.fromRGBO(255, 102, 0, 1),
                                      constraints: constraints,
                                      label: "Success Index",
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, evaluationTypeIntellectResultScreenRoute);
                                    },
                                    child: CircularWidget(
                                      assetName: personalEvaluationIcon,
                                      color: const Color.fromRGBO(255, 102, 0, 1),
                                      constraints: constraints,
                                      label: "Evaluation Of Type\nOf Intellect",
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, brainAnalyticsScreenRoute);
                                    },
                                    child: CircularWidget(
                                      assetName: knowYourselfIcon,
                                      color: Style.pColor,
                                      constraints: constraints,
                                      label: "Evaluation Of Type\nOf Mind",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10)
                        // TextButton(
                        //   onPressed: () {},
                        //   child: const Text("Skip"),
                        // ),
                      ],
                    ),
                  );
                }
              }
              return Container();
            }),
      ),
    );
  }
}

class OptionModel {
  final String assetName, title, routeName;

  OptionModel(this.assetName, this.title, this.routeName);
}

class CircularWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final Color color;
  final String assetName;
  final String label;
  const CircularWidget({
    Key? key,
    required this.constraints,
    required this.color,
    required this.assetName,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: constraints.maxWidth * 0.33,
      height: constraints.maxHeight * 0.25,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(0.25),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(7),
              height: constraints.maxHeight * 0.13,
              decoration: BoxDecoration(
                border: Border.all(),
                shape: BoxShape.circle,
                color: color,
              ),
              child: Center(child: Image.asset(assetName)),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              textScaleFactor: 0.8,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
