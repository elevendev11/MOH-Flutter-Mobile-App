import 'package:hive/hive.dart';
import 'package:sa_cooperation/clients/api_clients/api_base_helper.dart';
import 'package:sa_cooperation/models/happiness_index.dart';
import 'package:sa_cooperation/models/happiness_index_line_chart.dart';
import 'package:sa_cooperation/models/happiness_index_question_result.dart';
import 'package:sa_cooperation/models/happiness_index_result.dart';

import '../../models/user.dart';
import '../../utils/api_util.dart';

class HappinessIndexApiClient {
  final Box<User> box;
  final ApiBaseHelper apiBaseHelper;
  HappinessIndexApiClient(this.apiBaseHelper, this.box);

  Future<List<HappinessIndex>> findAllHappinessIndex() async {
    var user = loggedInUser();
    var response = await apiBaseHelper.get(
      url: "${ApiUtil.happinessIndexEndPoint}${user!.id}",
    );
    var list = response.response!['happinessIndexList'] as List;
    return list.map((e) => HappinessIndex.fromJson(e)).toList();
  }

  Future<String> submitHappinessIndex(Map<String, dynamic> requestBody) async {
    var response = await apiBaseHelper.post(
      url: ApiUtil.happinessIndexSubmitAnswerEndPoint,
      body: requestBody,
      headers: ApiUtil.headers(),
    );

    if (response.errorCode != 200) {
      throw Exception(response.errorMessage);
    }
    return response.errorMessage;
  }

  User? loggedInUser() => box.get('user');

  Future<List<HappinessIndexResult>> findAllHappinessIndexResult() async {
    var user = loggedInUser();
    var response = await apiBaseHelper.get(
      url: "${ApiUtil.happinessIndexResultEndPoint}${user!.id}",
    );
    var list = response.response!['happinessIndexResult'] as List;
    return list.map((e) => HappinessIndexResult.fromJson(e)).toList();
  }

  Future<List<HappinessIndexLineChart>> findAllHappinessIndexLineChartResult() async {
    var user = loggedInUser();
    var response = await apiBaseHelper.get(
      url: "${ApiUtil.happinessIndexLineChartResponse}${user!.id}",
    );
    var list = response.response!['happinessIndexLineChartResponseList'] as List;
    return list.map((e) => HappinessIndexLineChart.fromJson(e)).toList();
  }


    Future<List<HappinessIndexQuestionResult>> findAllHappinessIndexQuestionResult() async {
    var user = loggedInUser();
    var response = await apiBaseHelper.get(
      url: "${ApiUtil.happinessIndexQuestionResult}${user!.id}",
    );
    var list = response.response!['happinessIndexLowQuestionAnalytics'] as List;
    return list.map((e) => HappinessIndexQuestionResult.fromJson(e)).toList();
  }
}
