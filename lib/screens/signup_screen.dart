import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sa_cooperation/blocs/transaction-bloc/transaction_state.dart';
import 'package:sa_cooperation/utils/routes.dart';
import 'package:sa_cooperation/utils/style.dart';

import '../blocs/transaction-bloc/transaction_bloc.dart';
import '../blocs/transaction-bloc/transaction_event.dart';
import '../utils/icon_util.dart';
import '../widgets/activity_indicator.dart';
import 'package:path/path.dart' as p;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, dynamic> _requestBody = {};
  bool _isAcceptTermsAndConditions = false;
  File? _image;

  validate() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.loaderOverlay.show();
      BlocProvider.of<TransactionBloc>(context).add(CreateUser(_requestBody));
    } else {
      print("Not Validated");
    }
  }

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      setState(() {
        _image = File(image.path);
        _requestBody['image'] = _image;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.pColor,
        title: const Text(
          "Create An Account",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            "assets/images/back_arrow.png",
            height: 25,
          ),
        ),
      ),
      body: LoaderOverlay(
        overlayWidget: const ActivityIndicator(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 10,
          ),
          child: BlocListener<TransactionBloc, TransactionState>(
            listener: (context, state) {
              if (state is TransactionSuccess) {
                context.loaderOverlay.hide();
                Navigator.pushNamed(context, loginScreenRoute);
              } else if (state is TransactionError) {
                context.loaderOverlay.hide();
              }
            },
            child: Form(
              key: _formKey,
              child: Center(
                child: ListView(
                  children: [
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "Your Expert Track Awaits..",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "Sign in and start your journey",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SocialWidget(
                          height: height,
                          width: width,
                          assetName: facebookIcon,
                        ),
                        const Text("OR"),
                        SocialWidget(
                          height: height,
                          width: width,
                          assetName: googleIcon,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Your activity will never be visible to anyone on facebook.",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      cursorColor: Style.textSecondaryColor.withOpacity(0.2),
                      cursorWidth: 1,
                      autocorrect: true,
                      onSaved: (value) {
                        _requestBody['name'] = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1.5,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 16,
                          bottom: 16,
                          top: 16,
                          right: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      cursorColor: Style.textSecondaryColor.withOpacity(0.2),
                      cursorWidth: 1,
                      autocorrect: true,
                      onSaved: (value) {
                        _requestBody['email'] = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1.5,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 16,
                          bottom: 16,
                          top: 16,
                          right: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      cursorColor: Style.textSecondaryColor.withOpacity(0.2),
                      cursorWidth: 1,
                      autocorrect: false,
                      obscureText: true,
                      enableSuggestions: false,
                      onSaved: (value) {
                        _requestBody['password'] = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1.5,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 16,
                          bottom: 16,
                          top: 16,
                          right: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      cursorColor: Style.textSecondaryColor.withOpacity(0.2),
                      cursorWidth: 1,
                      autocorrect: false,
                      obscureText: true,
                      enableSuggestions: false,
                      onSaved: (value) {
                        _requestBody['password_confirmation'] = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirm Password is required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1.5,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 16,
                          bottom: 16,
                          top: 16,
                          right: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ClipRRect(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _createUploadImageModalBottomSheet(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Style.pColor,
                            elevation: 0.0,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6.0),
                              ),
                            ),
                          ),
                          label: const Text("Upload Image"),
                          icon: const Icon(
                            Icons.upload_rounded,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          _image != null
                              ? Container(
                                  color: const Color(0xFFF3F6F9),
                                  child: ListTile(
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image.file(
                                        _image!,
                                        fit: BoxFit.fill,
                                        height: 40,
                                        width: 40,
                                      ),
                                    ),
                                    title: Text(p.basename(_image!.path)),
                                    trailing: IconButton(
                                      icon: const Icon(
                                        Icons.cancel_outlined,
                                        color: Colors.red,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        setState(
                                          () {
                                            _image = null;
                                            _requestBody['file'] = null;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                )
                              : Container(),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _isAcceptTermsAndConditions,
                      onChanged: (value) {
                        setState(() {
                          _isAcceptTermsAndConditions = value ?? false;
                        });
                      },
                      title: const Text(
                        "I agree to the Management of Happiness's terms of service and privacy policy",
                        textAlign: TextAlign.start,
                        textScaleFactor: 0.8,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(
                          height: height * 0.075,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Style.pColor,
                          ),
                          onPressed: _isAcceptTermsAndConditions
                              ? () {
                                  validate();
                                }
                              : null,
                          child: const Text(
                            "CONTINUE",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
            ),
          ),
        ),
      ),
    );
  }

  void _createUploadImageModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: Icon(Icons.camera),
              ),
              title: const Text(
                'Take picture',
                textScaleFactor: 1.0,
              ),
              onTap: () {
                getImage(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: Icon(Icons.photo_library),
              ),
              title: const Text(
                'Pick from gallery',
                textScaleFactor: 1.0,
              ),
              onTap: () {
                getImage(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 20)
          ],
        );
      },
    );
  }
}

class SocialWidget extends StatelessWidget {
  const SocialWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.assetName,
  }) : super(key: key);

  final double height;
  final double width;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.075,
      width: width * 0.31,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(4),
            height: height * 0.073,
            width: width * 0.23,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Style.pColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign up with",
                  textScaleFactor: 0.75,
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: width * 0.18,
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1.5,
                  color: Colors.blue,
                ),
              ),
              child: Image.asset(
                assetName,
                height: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
