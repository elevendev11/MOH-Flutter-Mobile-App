import 'package:flutter/material.dart';
import 'package:sa_cooperation/utils/routes.dart';
import 'package:sa_cooperation/utils/style.dart';

class JourneyScreen extends StatefulWidget {
  const JourneyScreen({Key? key}) : super(key: key);

  @override
  State<JourneyScreen> createState() => _JourneyScreenState();
}

class _JourneyScreenState extends State<JourneyScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.03,
        ),
        height: height,
        width: width,
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              "assets/images/logo.png",
              height: height * 0.32,
              width: width * 0.6,
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, getStartedScreenRoute);
              },
              child: const Text("Let's Start The Journey"),
              style: ElevatedButton.styleFrom(primary: Style.pColor, padding: const EdgeInsets.all(14)),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, loginScreenRoute);
              },
              child: const Text(
                "Already a member?\nLOGIN",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Style.pColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
