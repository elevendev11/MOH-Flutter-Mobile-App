import 'dart:io';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sa_cooperation/blocs/authentication-bloc/authentication_bloc.dart';
import 'package:sa_cooperation/blocs/authentication-bloc/authentication_state.dart';
import 'package:sa_cooperation/blocs/transaction-bloc/transaction.dart';
import 'package:sa_cooperation/models/user.dart';
import 'package:sa_cooperation/utils/api_util.dart';
import 'package:sa_cooperation/utils/date_util.dart';
import 'package:sa_cooperation/utils/style.dart';
import 'package:sa_cooperation/widgets/activity_indicator.dart';

import '../utils/icon_util.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final dateController = TextEditingController();
  Map<String, dynamic> _requestBody = {};
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? _image;
  String _selectedGender = 'male';
  var box = Hive.box<User>('user');

  // Future<void> getImage() async {
  //   image = await ImagePicker().pickImage(source: ImageSource.camera);
  // }

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

  void validate() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.loaderOverlay.show();
      BlocProvider.of<TransactionBloc>(context).add(UpdateUser(_requestBody));
    } else {
      print("Not Validated");
    }
  }

  @override
  void initState() {
    super.initState();
    var gender = box.get('user')!.gender;
    if (gender != null) {
      _selectedGender = gender.toString();
      _requestBody.putIfAbsent('gender', () => gender);
    } else {
      _selectedGender = _selectedGender;
    
    }
      print(_requestBody);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: LoaderOverlay(
        overlayWidget: const ActivityIndicator(),
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationAuthenticated) {
              return SingleChildScrollView(
                child: BlocListener<TransactionBloc, TransactionState>(
                  listener: (context, state) {
                    if (state is TransactionSuccess) {
                      context.loaderOverlay.hide();
                      Navigator.pop(context);
                    } else if (state is TransactionError) {
                      context.loaderOverlay.hide();
                    }
                  },
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.4,
                          width: width,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Container(
                                height: height * 0.38,
                                width: width,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(224, 225, 249, 1),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(height * 0.28),
                                    bottomRight: Radius.circular(height * 0.28),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  height: height * 0.25,
                                  width: width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromRGBO(173, 174, 227, 1),
                                        spreadRadius: 6,
                                        blurRadius: 10,
                                        offset: new Offset(0, -6),
                                      ),
                                    ],
                                    image: DecorationImage(
                                      image: Image.network(
                                        state.user.image != null ? '${ApiUtil.profileImageEndPoint}/${state.user.image}' : avatarNetworkIcon,
                                        fit: BoxFit.cover,
                                      ).image,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: height * 0.16,
                                right: width * 0.29,
                                child: CircleAvatar(
                                  backgroundColor: Colors.deepPurple[50],
                                  child: IconButton(
                                    onPressed: () async {
                                      // await getImage();
                                      _createUploadImageModalBottomSheet(context);
                                    },
                                    icon: const Icon(
                                      Icons.image,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                          ValueListenableBuilder<Box<User>>(
                            valueListenable: Hive.box<User>('user').listenable(),
                            builder: (context, box, widget) {
                              if (box.isNotEmpty) {
                                var user = box.getAt(0);
                                print("Boxxxx${user!.name}");
                                if (user.name.isNotEmpty) {
                                  return Text(
                                    "Hello ${user.name}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }
                              }
                              return Container();
                            },
                          ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                          child: TextFormField(
                            initialValue: state.user.name,
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
                              hintText: 'Enter Your name',
                              filled: true,
                              fillColor: Colors.grey[300],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusColor: Colors.grey[300],
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                          child: Row(
                            children: [
                              const Text(
                                "Gender",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              const Spacer(),
                              Radio(
                                value: 'male',
                                groupValue: _selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedGender = value.toString();
                                    _requestBody['gender'] = _selectedGender.toString();
                                  });
                                },
                              ),
                              const Text(
                                "Male",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              Spacer(),
                              Radio(
                                value: 'female',
                                groupValue: _selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedGender = value.toString();
                                    _requestBody['gender'] = _selectedGender.toString();
                                  });
                                },
                              ),
                              const Text(
                                "Female",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                          child: DateTimeField(
                            initialValue: state.user.dob!,
                            decoration: InputDecoration(
                                hintText: "Enter DOB",
                                filled: true,
                                fillColor: Colors.grey[300],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusColor: Colors.grey[300],
                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                            format: DateUtil.defaultDateFormat,
                            onSaved: (DateTime? value) {
                              if (value != null) {
                                _requestBody['dob'] = value.millisecondsSinceEpoch.toString();
                              }
                            },
                            validator: (value) => value == null ? 'From date is required.' : null,
                            onShowPicker: (context, currentValue) async {
                              final date = await showDatePicker(
                                context: context,
                                builder: (context, child) {
                                  return Theme(
                                    data: ThemeData.light().copyWith(
                                      colorScheme: ColorScheme.fromSwatch(
                                        primarySwatch: Style.primarySwatch,
                                        backgroundColor: Style.textPrimaryColor,
                                        accentColor: Style.textPrimaryColor,
                                      ),
                                      dialogBackgroundColor: Colors.white,
                                    ),
                                    child: child ?? const SizedBox(),
                                  );
                                },
                                firstDate: DateTime(1900),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100),
                              );
                              if (date != null) {
                                return date;
                              } else {
                                return currentValue;
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                          child: TextFormField(
                            initialValue: state.user.email,
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
                              hintText: 'Enter Email',
                              filled: true,
                              fillColor: Colors.grey[300],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusColor: Colors.grey[300],
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            initialValue: state.user.phoneNo,
                            onSaved: (value) {
                              _requestBody['phoneNo'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Enter Phone Number",
                              filled: true,
                              fillColor: Colors.grey[300],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusColor: Colors.grey[300],
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          width: width * 0.4,
                          height: height * 0.07,
                          child: ElevatedButton(
                            onPressed: () {
                              validate();
                            },
                            child: Text(
                              "Save",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange[900],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return Container();
          },
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
