import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sa_cooperation/blocs/login-bloc/login_bloc.dart';
import 'package:sa_cooperation/blocs/transaction-bloc/transaction_bloc.dart';
import 'package:sa_cooperation/blocs/transaction-bloc/transaction_state.dart';
import 'package:sa_cooperation/models/user.dart';
import 'package:sa_cooperation/repositories/login_repository.dart';
import 'package:sa_cooperation/utils/api_util.dart';
import 'package:sa_cooperation/utils/icon_util.dart';
import 'package:sa_cooperation/utils/routes.dart';
import 'package:sa_cooperation/utils/style.dart';
import 'package:sa_cooperation/utils/system_util.dart';
import 'package:sa_cooperation/widgets/activity_indicator.dart';

import '../blocs/login-bloc/login_event.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    RepositoryProvider.of<LoginRepository>(context).refreshUser();
    BlocProvider.of<LoginBloc>(context).add(RefreshUser());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    DateTime now = DateTime.now();
    String currentFormatterDateTime = DateFormat.yMMMd().format(now);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.pColor,
        automaticallyImplyLeading: false,
        title: const Text(
          "Management Of Happiness",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                helpIcon,
                width: 30,
              ),
            ),
          ),
        ],
      ),
      body: LoaderOverlay(
        overlayWidget: const ActivityIndicator(),
        child: Container(
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
          child: BlocListener<TransactionBloc, TransactionState>(
            listener: (context, state) {
              if (state is TransactionSuccess) {
                context.loaderOverlay.hide();
                SystemUtil.buildSuccessSnackbar(
                  context,
                  state.message,
                );
              } else if (state is TransactionError) {
                context.loaderOverlay.hide();
                SystemUtil.buildErrorSnackbar(
                  context,
                  state.message,
                );
              }
            },
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
                                  errorBuilder: (context, error, stackTrace) {
                                    return CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Image.asset(
                                        avatarIcon,
                                      ),
                                    );
                                  },
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
                          SizedBox(
                            height: constraints.maxHeight * 0.01,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: constraints.maxWidth * 0.2,
                            ),
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                tileMode: TileMode.clamp,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(211, 211, 246, 2),
                                  Colors.white,
                                ],
                              ),
                            ),
                            width: constraints.maxWidth * 0.6,
                            height: constraints.maxHeight * 0.21,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  "Quote of the Day",
                                  textScaleFactor: 0.8,
                                ),
                                const Divider(
                                  color: Colors.white,
                                  height: 3,
                                ),
                                const Text(
                                  "Its is a very impressive qoute that you have seen listened ever in your life.",
                                  textScaleFactor: 0.8,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '- ${user.name}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textScaleFactor: 0.9,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.02,
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.01,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, happinessIndexScreenRoute);
                            },
                            child: Tile(
                              assetName: happinessIcon,
                              constraints: constraints,
                              currentDate: currentFormatterDateTime,
                              previousDate: currentFormatterDateTime,
                              title: "Happiness Index",
                              isEven: false,
                            ),
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, successIndexScreenRoute);
                            },
                            child: Tile(
                              assetName: successIndexIcon,
                              constraints: constraints,
                              currentDate: currentFormatterDateTime,
                              previousDate: currentFormatterDateTime,
                              title: "Success Index",
                              isEven: true,
                            ),
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, evaluationTypeIntellectScreenRoute);
                            },
                            child: Tile(
                              assetName: personalEvaluationIcon,
                              constraints: constraints,
                              currentDate: currentFormatterDateTime,
                              previousDate: currentFormatterDateTime,
                              title: "Evaluation of Type of Intellect",
                              isEven: false,
                            ),
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, evaluationTypeMindScreenRoute);
                            },
                            child: Tile(
                              assetName: knowYourselfIcon,
                              constraints: constraints,
                              currentDate: currentFormatterDateTime,
                              previousDate: currentFormatterDateTime,
                              title: "Evaluation of Type of Mind",
                              isEven: true,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  final BoxConstraints constraints;
  final String assetName;
  final String title;
  final String previousDate;
  final String currentDate;
  final bool isEven;

  Tile({
    required this.constraints,
    required this.assetName,
    required this.title,
    required this.previousDate,
    required this.currentDate,
    required this.isEven,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: constraints.maxHeight * 0.018,
        bottom: constraints.maxHeight * 0.018,
        left: constraints.maxWidth * 0.1,
      ),
      width: constraints.maxWidth,
      height: constraints.maxHeight * 0.15,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            height: constraints.maxHeight * 0.15,
            width: constraints.maxWidth * 0.19,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: isEven
                    ? const Color.fromRGBO(255, 102, 0, 1)
                    : Style.pColor,
              ),
              color:
                  isEven ? Style.pColor : const Color.fromRGBO(255, 102, 0, 1),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Image.asset(assetName),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title,
                textScaleFactor: 1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // fontSize: 18,
                ),
              ),
              // Spacer(),
              Text(
                "Previous Date: $previousDate\nCurrent Date: $currentDate",
                textScaleFactor: 0.85,
              )
            ],
          )
        ],
      ),
    );
  }
}
