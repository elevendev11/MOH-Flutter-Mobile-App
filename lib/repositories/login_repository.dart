

import 'package:sa_cooperation/clients/api_clients/login_api_client.dart';
import 'package:sa_cooperation/models/user.dart';

class LoginRepository {
  final LoginApiClient apiClient;
  LoginRepository(this.apiClient);

  Future<User> createLogin(Map<String, dynamic> requestBody) {
    return apiClient.createLogin(requestBody);
  }

  User? get getLoggedInUser => apiClient.loggedInUser();

  Future<void> logoutUser() {
    return apiClient.logoutUser();
  }

    Future<User> refreshUser() {
    return apiClient.refreshUser();
  } 
}