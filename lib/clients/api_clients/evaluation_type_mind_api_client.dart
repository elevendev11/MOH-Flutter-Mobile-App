import 'package:hive/hive.dart';
import 'package:sa_cooperation/clients/api_clients/api_base_helper.dart';
import 'package:sa_cooperation/models/evaluation_mind_question_result.dart';
import 'package:sa_cooperation/models/evaluation_mind_result.dart';
import 'package:sa_cooperation/models/evaluation_type_mind.dart';
import 'package:sa_cooperation/models/user.dart';

import '../../utils/api_util.dart';

class EvaluationTypeMindApiClient {
  final ApiBaseHelper apiBaseHelper;
  final Box<User> box;
  EvaluationTypeMindApiClient(this.apiBaseHelper, this.box);

  User? loggedInUser() => box.get('user');

  Future<List<EvaluationTypeMind>> findAllEvaluationTypeIntellect() async {
    var _user = loggedInUser();
    var response = await apiBaseHelper.get(
      url: "${ApiUtil.evaluationTypeMindEndPoint}${_user!.id}",
    );
    var list = response.response!['evaluationTypeMindList'] as List;
    return list.map((e) => EvaluationTypeMind.fromJson(e)).toList();
  }

  Future<String> submitEvaluationTypeMind(Map<String, dynamic> requestBody) async {
    var response = await apiBaseHelper.post(
      url: ApiUtil.evaluationTypeMindSubmitAnswerEndPoint,
      body: requestBody,
      headers: ApiUtil.headers(),
    );

    if (response.errorCode != 200) {
      throw Exception(response.errorMessage);
    }
    return response.errorMessage;
  }

  Future<List<EvaluationMindResult>> fetchEvaluationTypeMindResult() async {
    var _user = loggedInUser();
    var response = await apiBaseHelper.get(
      url: "${ApiUtil.evaluationTypeMindResultEndPoint}${_user!.id}",
      headers: ApiUtil.headers(),
    );

    var list = response.response!['evaluationMindResult'] as List;
    return list.map((e) => EvaluationMindResult.fromJson(e)).toList();
  }

  Future<List<EvaluationMindQuestionResult>> fetchEvaluationTypeMindQuestionResult() async {
    var _user = loggedInUser();
    var response = await apiBaseHelper.get(
      url: "${ApiUtil.evaluationTypeMindQuestionResultEndPoint}${_user!.id}",
      headers: ApiUtil.headers(),
    );

    var list = response.response!['evaluationMindQuestionResult'] as List;
    return list.map((e) => EvaluationMindQuestionResult.fromJson(e)).toList();
  }
}
