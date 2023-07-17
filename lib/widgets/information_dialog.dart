import 'package:flutter/material.dart';
import 'package:sa_cooperation/utils/icon_util.dart';
import 'package:sa_cooperation/utils/style.dart';

void getInformationDialog(BuildContext context, String questionInfo) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  showDialog(
      context: context,
      builder: (context) => Stack(
            children: [
              AlertDialog(
                contentPadding: EdgeInsets.zero,
                content: Container(
                  padding: const EdgeInsets.all(10),
                  height: height * 0.45,
                  width: width * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    // height: height * 0.4,
                    // width: width * 0.65,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        tileMode: TileMode.clamp,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(211, 211, 246, 2),
                          Colors.white,
                          Colors.white,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          child: Text(
                            questionInfo,
                            textScaleFactor: 0.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.22,
                left: width * 0.43,
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Style.pColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      helpIcon,
                      // height: 10,
                    ),
                  ),
                ),
              )
            ],
          ));
}
