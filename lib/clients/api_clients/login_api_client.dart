import 'package:hive/hive.dart';
import 'package:sa_cooperation/clients/api_clients/api_base_helper.dart';
import 'package:sa_cooperation/models/user.dart';
import 'package:sa_cooperation/utils/api_util.dart';

class LoginApiClient {
  final ApiBaseHelper apiBaseHelper;
  final Box<User> box;

  LoginApiClient(this.apiBaseHelper, this.box);

  Future<User> createLogin(Map<String, dynamic> requestBody) async {
    var response = await apiBaseHelper.post(
      url: ApiUtil.loginEndPoint,
      body: requestBody,
      headers: ApiUtil.headers(),
    );
    if (response.errorCode != 200) {
      throw Exception(response.errorMessage);
    }
    User _user = User.fromJson(response.response!);
    box.put('user', _user);
    return _user;
  }

  Future<void> deleteUser(String id) async {
    var response = await apiBaseHelper.delete(
      url: "${ApiUtil.deleteUserEndPoint}/$id",
      headers: ApiUtil.headers(),
    );
    print("DELETE_USER : ${response.response}");
    if (response.errorCode == 200) {
      box.clear();
    }

  }

  User? loggedInUser() => box.get('user');

  Future<void> logoutUser() async {
    await logoutSessionUser();
    box.clear();
    return;
  }

  Future<String> logoutSessionUser() async {
    var user = loggedInUser();
    var response = await apiBaseHelper.post(
        url: ApiUtil.logoutEndPoint,
        headers: ApiUtil.headers(
          authorization: 'Bearer ${user!.tokenId}',
        ));

    if (response.errorCode != 200) {
      throw Exception(response.errorMessage);
    }
    return response.response.toString();
  }

  Future<User> refreshUser() async {
    Map<String, dynamic> requestBody = {
      'email': loggedInUser()!.email,
      'password': loggedInUser()!.password,
    };

    var response = await apiBaseHelper.post(
      url: ApiUtil.loginEndPoint,
      body: requestBody,
      headers: ApiUtil.headers(),
    );
    if (response.errorCode != 200) {
      throw Exception(response.errorMessage);
    }
    User _user = User.fromJson(response.response!);
    box.put('user', _user);
    return _user;
  }
}
