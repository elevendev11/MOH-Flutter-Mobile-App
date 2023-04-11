import 'package:flutter/material.dart';

import '../utils/style.dart';

class LineGraphScreen extends StatefulWidget {
  const LineGraphScreen({super.key});

  @override
  State<LineGraphScreen> createState() => _LineGraphScreenState();
}

class _LineGraphScreenState extends State<LineGraphScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.pColor,
        title: const Text(
          "Happiness",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
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
                  "Previous Result",
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
                                "Alex Hales",
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
                              const Spacer(),
                              const Chip(
                                label: Text(
                                  "Happiness\nIndex",
                                  style: TextStyle(
                                    fontSize: 8,
                                  ),
                                ),
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
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   width: width * 0.8,
                //   height: height * 0.6,
                //   decoration: BoxDecoration(),
                //   child: LineChartWidget(),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
