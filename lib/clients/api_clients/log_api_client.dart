import 'package:hive_flutter/hive_flutter.dart';
import 'package:sa_cooperation/clients/api_clients/api_base_helper.dart';
import 'package:sa_cooperation/models/log_response.dart';
import 'package:sa_cooperation/models/user.dart';
import 'package:sa_cooperation/utils/api_util.dart';

class LogApiClient {
  final ApiBaseHelper apiBaseHelper;
  final Box<User> box;
  LogApiClient(this.apiBaseHelper, this.box);

  Future<LogResponse> findAllLogs() async {
    var user = loggedInUser();
    var response = await apiBaseHelper.get(
      url: "${ApiUtil.logsEndPoint}${user!.id}",
    );

    if (response.errorCode != 200) {
      throw Exception(response.errorMessage);
    }
    LogResponse? logResponse = LogResponse.fromJson(response.response?['happinessIndexList']);
    return logResponse;
  }

  User? loggedInUser() => box.get('user');
}
