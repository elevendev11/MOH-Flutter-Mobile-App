import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sa_cooperation/blocs/login-bloc/login_event.dart';
import 'package:sa_cooperation/utils/icon_util.dart';
import '../blocs/authentication-bloc/authentication_bloc.dart';
import '../blocs/authentication-bloc/authentication_event.dart';
import '../blocs/login-bloc/login_bloc.dart';
import '../blocs/login-bloc/login_state.dart';
import '../utils/style.dart';
import '../utils/system_util.dart';
import '../widgets/activity_indicator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, dynamic> _requestBody = {};
  bool _isAcceptTermsAndConditions = false;

  void validate() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      BlocProvider.of<LoginBloc>(context).add(Login(_requestBody));
      context.loaderOverlay.show();
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
          "Login",
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
            backButtonIcon,
            height: 25,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          SystemUtil.hideKeyboard();
        },
        child: LoaderOverlay(
          overlayWidget: const ActivityIndicator(),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                context.loaderOverlay.hide();
                context.read<AuthenticationBloc>().add(LoggedInUser());
              } else if (state is LoginError) {
                context.loaderOverlay.hide();
                SystemUtil.buildErrorSnackbar(context, state.response);
              }
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "Your Expert Track Awaits..",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "Sign in and start your journey",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        cursorColor: Style.textSecondaryColor.withOpacity(0.2),
                        cursorWidth: 1,
                        autocorrect: true,
                        onSaved: (value) {
                          _requestBody['email'] = value;
                          // _requestBody.putIfAbsent('email', () => value);
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
                        autocorrect: false,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        cursorWidth: 1,
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
                      const SizedBox(
                        height: 15,
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
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(
                          height: height * 0.075,
                          width: width * 0.7,
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
                            "LOGIN",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
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
      ),
    );
  }
}
