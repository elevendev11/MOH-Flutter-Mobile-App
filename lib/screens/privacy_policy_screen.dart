import 'package:flutter/material.dart';

import '../utils/style.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  bool isTermsVisible = true;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.pColor,
        title: const Text(
          "Terms & Privacy Policy",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: Container(
        width: width,
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            const Text(
              "Key Updates",
              textScaleFactor: 1.8,
              style: TextStyle(
                color: Style.pColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    if (isTermsVisible == false) {
                      setState(() {
                        isTermsVisible = true;
                      });
                    }
                  },
                  child: const Text(
                    "Terms of service",
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                ),
                const Text(
                  "|",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (isTermsVisible == true) {
                      setState(() {
                        isTermsVisible = false;
                      });
                    }
                  },
                  child: const Text(
                    "Privacy Policy",
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
            if (isTermsVisible) TermsWidget(),
            if (!isTermsVisible) PolicyWidget(),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                width: width * 0.3,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.orange[700],
                  primary: Colors.orange[700], // background
                ),
                child: const Text("Agree"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PolicyWidget extends StatelessWidget {
  const PolicyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      textAlign: TextAlign.justify,
    );
  }
}

class TermsWidget extends StatelessWidget {
  const TermsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      textAlign: TextAlign.justify,
    );
  }
}
