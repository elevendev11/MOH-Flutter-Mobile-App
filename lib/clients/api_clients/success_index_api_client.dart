import 'package:hive/hive.dart';
import 'package:sa_cooperation/clients/api_clients/api_base_helper.dart';
import 'package:sa_cooperation/models/success_index.dart';
import 'package:sa_cooperation/models/success_index_line_chart.dart';
import 'package:sa_cooperation/models/success_index_question_result.dart';
import 'package:sa_cooperation/models/success_index_result.dart';
import 'package:sa_cooperation/models/user.dart';

import '../../utils/api_util.dart';

class SuccessIndexApiClient {
  final Box<User> box;
  final ApiBaseHelper apiBaseHelper;
  SuccessIndexApiClient(this.apiBaseHelper, this.box);

  Future<List<SuccessIndex>> findAllSuccessIndex() async {
        var _user = loggedInUser();
    var response = await apiBaseHelper.get(
      url: "${ApiUtil.successIndexEndPoint}${_user!.id}",
    );
    var list = response.response!['successIndexList'] as List;
    return list.map((e) => SuccessIndex.fromJson(e)).toList();
  }

  Future<String> submitSuccessIndex(Map<String, dynamic> requestBody) async {
    var response = await apiBaseHelper.post(
      url: '${ApiUtil.successIndexSubmitAnswerEndPoint}',
      body: requestBody,
      headers: ApiUtil.headers(),
    );

    if (response.errorCode != 200) {
      throw  Exception(response.errorMessage);
    }
    return response.errorMessage;
  }

  User? loggedInUser() => box.get('user');


    Future<List<SuccessIndexLineChart>> fetchsuccessIndexLineChartResponseList() async {
    var _user = loggedInUser();
    var response = await apiBaseHelper.get(
      url: "${ApiUtil.successIndexLineChartResponse}${_user!.id}",
    );
    var list = response.response!['successIndexLineChartResponseList'] as List;
    return list.map((e) => SuccessIndexLineChart.fromJson(e)).toList();
  }

  Future<List<SuccessResult>> findSuccessIndexResult() async {
    var _user = loggedInUser();
    var response = await apiBaseHelper.get(
      url: "${ApiUtil.successIndexResultEndPoint}${_user!.id}",
    );
    var list = response.response!['successResponseList'] as List;
    return list.map((e) => SuccessResult.fromJson(e)).toList();
  }


    Future<List<SuccessIndexQuestionResult>> findSuccessIndexQuestionResult() async {
    var _user = loggedInUser();
    var response = await apiBaseHelper.get(
      url: "${ApiUtil.successIndexQuestionResult}${_user!.id}",
    );
    var list = response.response!['successIndexLowQuestionAnalytics'] as List;
    return list.map((e) => SuccessIndexQuestionResult.fromJson(e)).toList();
  }
}
