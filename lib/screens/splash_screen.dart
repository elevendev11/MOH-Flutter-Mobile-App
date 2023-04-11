import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sa_cooperation/utils/icon_util.dart';

import '../utils/routes.dart';

class SplashScreen extends StatefulWidget {
  final bool isRouteToWalkThrough;
  const SplashScreen({Key? key, this.isRouteToWalkThrough = true}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  Timer? _timer;
  startTime() async {
    _timer = Timer(const Duration(seconds: 3), navigationPage);
    return _timer;
  }

  @override
  void initState() {
    super.initState();

    if (widget.isRouteToWalkThrough) {
      startTime();
    }
  }

  void navigationPage() {
    Navigator.pushNamed(context, walkThroughScreenRoute);
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                splashIcon,
                height: 350,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      splashIcon,
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
