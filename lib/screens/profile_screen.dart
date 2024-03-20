import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sa_cooperation/blocs/authentication-bloc/authentication_bloc.dart';
import 'package:sa_cooperation/blocs/authentication-bloc/authentication_state.dart';
import 'package:sa_cooperation/models/user.dart';
import 'package:sa_cooperation/utils/api_util.dart';
import 'package:sa_cooperation/utils/icon_util.dart';
import 'package:sa_cooperation/utils/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sa_cooperation/widgets/activity_indicator.dart';

import '../blocs/authentication-bloc/authentication_event.dart';
import '../utils/style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isExapnded = false;
  var box = Hive.box<User>('user');

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return LoaderOverlay(
      overlayWidget: const ActivityIndicator(),
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.4,
                      width: width,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            height: height * 0.38,
                            width: width,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(224, 225, 249, 1),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(height * 0.28),
                                bottomRight: Radius.circular(height * 0.28),
                              ),
                            ),
                          ),
                          ValueListenableBuilder<Box<User>>(
                            valueListenable:
                                Hive.box<User>('user').listenable(),
                            builder: (context, box, widget) {
                              if (box.isNotEmpty) {
                                var user = box.getAt(0);
                                print("Boxxxx${user!.image}");
                                if (user.name.isNotEmpty) {
                                  return Positioned(
                                    bottom: 0,
                                    child: Container(
                                      height: height * 0.25,
                                      width: width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color.fromRGBO(
                                                173, 174, 227, 1),
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
                                  );
                                }
                              }
                              return Container();
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Text(
                    //   '${state.user.name}',
                    //   style: const TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    //   textScaleFactor: 0.9,
                    // ),
                    ValueListenableBuilder<Box<User>>(
                      valueListenable: Hive.box<User>('user').listenable(),
                      builder: (context, box, widget) {
                        if (box.isNotEmpty) {
                          var user = box.getAt(0);
                          print("Boxxxx${user!.name}");
                          if (user.name.isNotEmpty) {
                            return Text(
                              user.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }
                        }
                        return Container();
                      },
                    ),
                    Text(
                      '${state.user.email}',
                      style: const TextStyle(
                        color: Colors.black,
                        // fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                      textScaleFactor: 0.85,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Stack(
                    //   children: [
                    //     Container(
                    //       height: height * 0.2,
                    //       width: width * 0.75,
                    //       decoration: BoxDecoration(
                    //         color: Colors.grey[350],
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Padding(
                    //             padding: EdgeInsets.only(
                    //               top: 12,
                    //               bottom: 12,
                    //               left: width * 0.12,
                    //             ),
                    //             child: const Text(
                    //               "Check Your Last Results",
                    //               style: TextStyle(
                    //                 // fontSize: 18,
                    //                 fontWeight: FontWeight.bold,
                    //               ),
                    //               textScaleFactor: 1,
                    //             ),
                    //           ),
                    //           Row(
                    //             // mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               SizedBox(
                    //                 width: width * 0.15,
                    //               ),
                    //               Image.asset(
                    //                 happinessIcon,
                    //                 height: 15,
                    //                 color: Colors.grey[800],
                    //               ),
                    //               const SizedBox(
                    //                 width: 5,
                    //               ),
                    //               Text(
                    //                 "Happiness Index",
                    //                 style: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                   color: Colors.grey[700],
                    //                 ),
                    //                 textScaleFactor: 0.8,
                    //               ),
                    //             ],
                    //           ),
                    //           const SizedBox(
                    //             height: 5,
                    //           ),
                    //           Row(
                    //             // mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               SizedBox(
                    //                 width: width * 0.15,
                    //               ),
                    //               Image.asset(
                    //                 successIndexIcon,
                    //                 height: 15,
                    //                 color: Colors.grey[800],
                    //               ),
                    //               const SizedBox(
                    //                 width: 5,
                    //               ),
                    //               Text(
                    //                 "Success Index",
                    //                 style: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                   color: Colors.grey[700],
                    //                 ),
                    //                 textScaleFactor: 0.8,
                    //               ),
                    //             ],
                    //           ),
                    //           const SizedBox(
                    //             height: 5,
                    //           ),
                    //           Row(
                    //             // mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               SizedBox(
                    //                 width: width * 0.15,
                    //               ),
                    //               Image.asset(
                    //                 personalEvaluationIcon,
                    //                 height: 15,
                    //                 color: Colors.grey[800],
                    //               ),
                    //               const SizedBox(
                    //                 width: 5,
                    //               ),
                    //               Text(
                    //                 "Evaluation of Type of Intellect",
                    //                 style: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                   color: Colors.grey[700],
                    //                 ),
                    //                 textScaleFactor: 0.8,
                    //               ),
                    //             ],
                    //           ),
                    //           const SizedBox(
                    //             height: 5,
                    //           ),
                    //           Row(
                    //             // mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               SizedBox(
                    //                 width: width * 0.15,
                    //               ),
                    //               Image.asset(
                    //                 knowYourselfIcon,
                    //                 color: Colors.grey[800],
                    //                 height: 15,
                    //               ),
                    //               const SizedBox(
                    //                 width: 5,
                    //               ),
                    //               Text(
                    //                 "Evaluation of Type of Mind",
                    //                 style: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                   color: Colors.grey[700],
                    //                 ),
                    //                 textScaleFactor: 0.8,
                    //               ),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     Transform.translate(
                    //       offset: Offset(-20, 0),
                    //       child: Material(
                    //         elevation: 5,
                    //         borderRadius: BorderRadius.circular(30),
                    //         child: CircleAvatar(
                    //           radius: 27,
                    //           backgroundColor: Colors.grey[350],
                    //           child: Image.asset(
                    //             resultIcon,
                    //             height: 25,
                    //             color: Colors.grey[800],
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, editProfileScreenRoute);
                      },
                      child: TileWidget(
                        width: width,
                        height: height,
                        title: "Edit Profile",
                        assetName: profileIcon,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, inviteScreenRoute);
                      },
                      child: TileWidget(
                        width: width,
                        height: height,
                        title: "Invite Friends",
                        assetName: inviteFriendsIcon,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, privacyPolicyScreenRoute);
                      },
                      child: TileWidget(
                        width: width,
                        height: height,
                        title: "Terms & Privacy Policy",
                        assetName: termsAndPolicyIcon,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        context.loaderOverlay.show();
                        if (Platform.isIOS) {
                          BlocProvider.of<AuthenticationBloc>(context)
                              .add(LoggedOut());
                        } else {
                          BlocProvider.of<AuthenticationBloc>(context)
                              .add(LoggedOut());
                        }
                        // context.loaderOverlay.hide();
                      },
                      child: TileWidget(
                        width: width,
                        height: height,
                        title: "Logout",
                        assetName: logoutIcon,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        context.loaderOverlay.show();
                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(DeleteUser());
                        // context.loaderOverlay.hide();
                      },
                      child: TileWidget(
                        width: width,
                        height: height,
                        title: "Delete Account",
                        assetName: deleteIcon,
                        iconColor: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // TextButton(
                    //   onPressed: () {},
                    //   child: Text(
                    //     "Skip",
                    //     style: TextStyle(
                    //       color: Colors.grey[800],
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class TileWidget extends StatelessWidget {
  TileWidget(
      {Key? key,
      required this.width,
      required this.height,
      required this.assetName,
      required this.title,
      this.iconColor = Colors.grey})
      : super(key: key);

  final double width;
  final double height;
  final String assetName;
  final String title;

  Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: width * 0.12,
          ),
          height: height * 0.07,
          width: width * 0.75,
          decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(
              title,
              style: const TextStyle(
                // fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 1,
              // textAlign: TextAlign.center,
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(-20, -3),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(30),
            child: CircleAvatar(
              radius: 27,
              backgroundColor: Colors.grey[350],
              child: Image.asset(
                assetName,
                height: 25,
                color: iconColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileListTile extends StatelessWidget {
  final String title;
  final String value;

  const ProfileListTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          title,
          style: Style.bodyText1.copyWith(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10),
        ),
        Text(
          value,
          style: Style.bodyText1.copyWith(color: Colors.blue[900]),
        ),
        const Divider(),
      ],
    );
  }
}
