import 'package:flutter/material.dart';
import 'package:sa_cooperation/utils/icon_util.dart';

import '../utils/style.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({super.key});

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Style.pColor,
        title: const Text(
          "Invite Friends",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: Container(
        width: width,
        padding: const EdgeInsets.all(45),
        child: Column(
          children: [
            const Text(
              "Share With Friends",
              textScaleFactor: 1.8,
              style: TextStyle(
                color: Style.pColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Because your friends deserves to Live Life Better.",
              textScaleFactor: 1.3,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              inviteIcon,
              width: width * 0.5,
            ),
            const SizedBox(
              height: 20,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                width: width * 0.3,
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange[700],
                ),
                child: const Text("Invite"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
