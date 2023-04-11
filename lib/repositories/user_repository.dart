import 'package:sa_cooperation/models/user.dart';

import '../clients/api_clients/user_api_client.dart';

class UserRepository {
  final UserApiClient apiClient;
  UserRepository(this.apiClient);

  Future<User> login(Map<String, dynamic> requestBody) {
    return apiClient.login(requestBody);
  }

  Future<String> createUser(Map<String, dynamic> requestBody) {
    return apiClient.createUser(requestBody);
  }

  User? get getLoggedInUser => apiClient.loggedInUser();

  Future<void> logoutUser() {
    return apiClient.logoutUser();
  }

  Future<String> updateUser(Map<String, dynamic> requestBody) {
    return apiClient.updateUser(requestBody);
  }
}
