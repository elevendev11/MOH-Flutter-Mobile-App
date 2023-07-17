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
      body: SingleChildScrollView(
        child: Container(
          width: width,
          padding: const EdgeInsets.all(30),
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
              if (isTermsVisible) const TermsWidget(),
              if (!isTermsVisible) const PolicyWidget(),
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
                    backgroundColor: Colors.orange[700], // background
                  ),
                  child: const Text("Agree"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PolicyWidget extends StatelessWidget {
  const PolicyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          _buildHeading(
              'We are committed to protecting your privacy and ensuring the security of your personal information. By using the Management of Happiness mobile app, you consent to the collection, storage, and processing of your personal data as described in this Privacy Statement.'),
          const SizedBox(height: 10),
          _buildHeading('Collection and Use of Personal Information:'),
          _buildContent(
            'The App collects basic contact information, including your name, age, gender, qualifications, and contact email. This information is used to provide personalized services, analyze user demographics, and improve the App\'s functionality and features.',
          ),
          _buildHeading('Test Results and Analytics:'),
          _buildContent(
            'The App stores your previous test results, including evaluations of your happiness, success, type of intellect, and type of mind. These results are used to provide personalized insights, recommendations, and statistical analysis to enhance user experience.',
          ),
          _buildHeading('Third-Party Access:'),
          _buildContent(
            'We may engage trusted third-party service providers to assist in operating the App and delivering its services. These service providers have access to your personal information solely for the purpose of performing their tasks on our behalf and are obligated to maintain its confidentiality.',
          ),
          _buildHeading('Data Retention:'),
          _buildContent(
            'We retain your personal information and test results for as long as necessary to fulfill the purposes outlined in this Privacy Statement, unless a longer retention period is required or permitted by law.',
          ),
          _buildHeading('Data Security:'),
          _buildContent(
            'We implement reasonable security measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, please note that no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee absolute security.',
          ),
          _buildHeading("Children's Privacy:"),
          _buildContent(
            'The App is not intended for use by individuals under the age of 12. We do not knowingly collect personal information from children. If you believe that we may have collected information from a child, please contact us immediately.',
          ),
          _buildHeading('Consent and Control:'),
          _buildContent(
            'By using the App, you consent to the collection, storage, and processing of your personal information as described in this Privacy Statement. You have the right to access, update, or delete your personal information by contacting us through the provided channels.',
          ),
          _buildHeading('Changes to the Privacy Statement:'),
          _buildContent(
            'We may update this Privacy Statement from time to time. We will notify you of any material changes by posting the updated Privacy Statement within the App. Your continued use of the App after the changes are made will indicate your acceptance of the updated Privacy Statement.',
          ),
          const SizedBox(height: 20),
          const Text(
            "Please read these Terms & Conditions and Privacy Statement carefully before using the Management of Happiness mobile app. If you do not agree with any of the terms or provisions, please refrain from using the App.",
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Widget _buildHeading(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _buildContent(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}

class TermsWidget extends StatelessWidget {
  const TermsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          _buildHeading('Personal Information:'),
          _buildContent(
            'The App collects and stores basic contact information, including your name, age, gender, qualifications, and contact email. This information is used solely for the purpose of providing personalized services and improving user experience.',
          ),
          _buildHeading('Test Results:'),
          _buildContent(
            'The App stores your previous test results, including evaluations of your happiness, success, type of intellect, and type of mind. These results are kept confidential and are used to provide personalized insights and recommendations.',
          ),
          _buildHeading('Accuracy of Information:'),
          _buildContent(
            'You agree to provide accurate and up-to-date information during registration and usage of the App. Any inaccuracies or outdated information may affect the accuracy of the results and recommendations provided by the App.',
          ),
          _buildHeading('Privacy and Security:'),
          _buildContent(
            'We value your privacy and take appropriate measures to protect your personal information. However, please be aware that no data transmission over the internet can be guaranteed as completely secure. By using the App, you acknowledge and accept the inherent risks involved in transmitting information online.',
          ),
          _buildHeading('User Responsibilities:'),
          _buildContent(
            'You are solely responsible for maintaining the confidentiality of your account and password associated with the App. You agree not to share your account credentials or engage in any activities that may compromise the security or integrity of the App.',
          ),
          _buildHeading('Intellectual Property:'),
          _buildContent(
            'The App and its content, including but not limited to text, graphics, images, logos, and software, are protected by intellectual property rights and are owned or licensed by the app developers. You agree not to modify, reproduce, distribute, or create derivative works based on the App without prior written consent.',
          ),
          _buildHeading('Disclaimer:'),
          _buildContent(
            'The App provides information and evaluations based on predefined algorithms and tests. The results and recommendations provided are for informational purposes only and should not substitute professional advice or treatment. We do not guarantee the accuracy, completeness, or effectiveness of the results obtained from the App.',
          ),
          _buildHeading('Modifications and Updates:'),
          _buildContent(
            'The app developers reserve the right to modify, update, or discontinue the App or any part of it, including its features, functionalities, or terms and conditions, at any time without prior notice.',
          ),
        ],
      ),
    );
  }

  Widget _buildHeading(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _buildContent(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
