import 'dart:convert';

import 'package:hive/hive.dart';

import 'package:sa_cooperation/clients/api_clients/api_base_helper.dart';
import 'package:sa_cooperation/models/user.dart';
import 'package:sa_cooperation/utils/api_util.dart';
import 'package:http/http.dart' as http;

class UserApiClient {
  final ApiBaseHelper apiBaseHelper;
  final Box<User> box;

  UserApiClient(this.apiBaseHelper, this.box);

  Future<User> login(Map<String, dynamic> requestBody) async {
    var response = await apiBaseHelper.post(
      url: ApiUtil.loginEndPoint,
      body: requestBody,
    );

    User _user = User.fromJson(response.response!);

    box.put('user', _user);
    return _user;
  }

  // Future<String> createUser(Map<String, dynamic> requestBody) async {
  //   var response = await apiBaseHelper.post(
  //     url: '${ApiUtil.registerEndPoint}',
  //     body: requestBody,
  //     headers: ApiUtil.headers(),
  //   );

  //   if (response.errorCode != 200) {
  //     throw Exception(response.errorMessage);
  //   }
  //   return response.errorMessage;
  // }

  Future<String> createUser(Map<String, dynamic> requestBody) async {
    var request = http.MultipartRequest('POST', Uri.parse(ApiUtil.registerEndPoint));

    request.fields['name'] = requestBody['name'];
    request.fields['email'] = requestBody['email'];
    request.fields['password'] = requestBody['password'];
    request.fields['password_confirmation'] = requestBody['password_confirmation'];

    if (requestBody['image'] != null) {
      request.files.add(http.MultipartFile(
        'image',
        requestBody['image'].readAsBytes().asStream(),
        requestBody['image'].lengthSync(),
        filename: requestBody['image'].path,
      ));
    }

    var response = await request.send();
    return response.reasonPhrase!;
  }

  User? loggedInUser() => box.get('user');

  Future<void> logoutUser() async {
    box.clear();
    return;
  }

  Future<String> updateUser(Map<String, dynamic> requestBody) async {
    var _user = loggedInUser();
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("${ApiUtil.updateUserEndPoint}${_user!.id}"),
    );

    request.fields['name'] = requestBody['name'];
    request.fields['email'] = requestBody['email'];
    request.fields['gender'] = requestBody['gender'];
    request.fields['phoneNo'] = requestBody['phoneNo'];
    request.fields['dob'] = requestBody['dob'];

    if (requestBody['image'] != null) {
      request.files.add(http.MultipartFile(
        'image',
        requestBody['image'].readAsBytes().asStream(),
        requestBody['image'].lengthSync(),
        filename: requestBody['image'].path,
      ));
    }

    var response = await request.send();
    await response.stream.bytesToString().then((value) {
      final data = jsonDecode(value);
      if (data['errorCode'] == 200) {
        final _userResponse = User.fromJson(data['response']);
        box.put('user', _userResponse);
      }
    });

    return response.reasonPhrase!;
  }
}
