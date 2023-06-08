import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sa_cooperation/blocs/authentication-bloc/authentication_bloc.dart';
import 'package:sa_cooperation/blocs/authentication-bloc/authentication_state.dart';
import 'package:sa_cooperation/models/user.dart';
import 'package:sa_cooperation/utils/api_util.dart';
import 'package:sa_cooperation/utils/icon_util.dart';
import 'package:sa_cooperation/utils/style.dart';

class EvaluationIntellectHistoryOptionScreen extends StatefulWidget {
  const EvaluationIntellectHistoryOptionScreen({Key? key}) : super(key: key);

  @override
  State<EvaluationIntellectHistoryOptionScreen> createState() =>
      _EvaluationIntellectOptionScreenState();
}

class _EvaluationIntellectOptionScreenState
    extends State<EvaluationIntellectHistoryOptionScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.pColor,
        title: const Text(
          "Happiness Index History",
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
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(173, 174, 227, 1),
                                spreadRadius: 6,
                                blurRadius: 10,
                                offset: Offset(0, -6),
                              ),
                            ],
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
                            user.email,
                            style: TextStyle(
                              fontSize: constraints.maxHeight * 0.02,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.08,
                        ),
                        HappinessDetailsWidget(constraints: constraints),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Skip"),
                        ),
                      ],
                    ),
                  );
                }
              }
              return Container();
            }),
      ),
      // bottomNavigationBar: const NavigationBar(),
    );
  }
}

class HappinessDetailsWidget extends StatefulWidget {
  final BoxConstraints constraints;
  const HappinessDetailsWidget({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  @override
  State<HappinessDetailsWidget> createState() => _HappinessDetailsWidgetState();
}

class _HappinessDetailsWidgetState extends State<HappinessDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Navigator.pushNamed(context, successBarChartScreenRoute);
          },
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: widget.constraints.maxWidth * 0.18,
            ),
            height: widget.constraints.maxHeight * 0.2,
            width: widget.constraints.maxWidth * 0.7,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(211, 211, 246, 2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  resultIcon,
                  height: 60,
                  color: Colors.grey[700],
                ),
                Text(
                  "Check Your Last Result",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: widget.constraints.maxHeight * 0.025,
                    color: Colors.grey[700],
                  ),
                )
              ],
            ),
          ),
        ),
        // const SizedBox(
        //   height: 25,
        // ),
        // GestureDetector(
        //   onTap: () {

        //   },
        //   child: Container(
        //     margin: EdgeInsets.symmetric(
        //       horizontal: widget.constraints.maxWidth * 0.18,
        //     ),
        //     height: widget.constraints.maxHeight * 0.2,
        //     width: widget.constraints.maxWidth * 0.7,
        //     decoration: BoxDecoration(
        //       color: Color.fromRGBO(211, 211, 246, 2),
        //       borderRadius: BorderRadius.circular(15),
        //     ),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         Image.asset(
        //           resultIcon,
        //           height: 60,
        //           color: Colors.grey[700],
        //         ),
        //         Text(
        //           "Commulative History",
        //           style: TextStyle(
        //             fontWeight: FontWeight.bold,
        //             fontSize: widget.constraints.maxHeight * 0.025,
        //             color: Colors.grey[700],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
