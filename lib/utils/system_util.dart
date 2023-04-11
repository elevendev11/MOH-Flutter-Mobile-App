import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sa_cooperation/utils/style.dart';

class SystemUtil {
  static void buildSnackbar(BuildContext context, String title, {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title,
          textScaleFactor: 1,
        ),
        backgroundColor: color,
        duration: Duration(seconds: 5),
      ),
    );
  }

  static void buildSuccessSnackbar(BuildContext context, String title) {
    buildSnackbar(context, title, color: Style.pColor);
  }

  static void buildErrorSnackbar(BuildContext context, String title) {
    buildSnackbar(context, title, color: Colors.red);
  }

  static hideKeyboard() {
    SystemChannels.textInput.invokeMethod("TextInput.hide");
  }
}
