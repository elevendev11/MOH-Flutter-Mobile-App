import 'package:hive/hive.dart';
import 'package:sa_cooperation/clients/api_clients/api_base_helper.dart';
import 'package:sa_cooperation/models/evaluation_type_intellect.dart';
import 'package:sa_cooperation/models/evaluation_type_intellect_result.dart';
import 'package:sa_cooperation/models/user.dart';

import '../../utils/api_util.dart';

class EvaluationTypeIntellectApiClient {
  final Box<User> box;
  final ApiBaseHelper apiBaseHelper;
  EvaluationTypeIntellectApiClient(this.apiBaseHelper, this.box);

  Future<List<EvaluationTypeIntellect>> findAllEvaluationTypeIntellect() async {
    var _user = loggedInUser();
    var response = await apiBaseHelper.get(
      url: "${ApiUtil.evaluationTypeIntellectEndPoint}${_user!.id}",
    );
    var list = response.response!['evaluationTypeIntellectList'] as List;
    return list.map((e) => EvaluationTypeIntellect.fromJson(e)).toList();
  }

  Future<String> submitEvaluationTypeIntellect(Map<String, dynamic> requestBody) async {
    var response = await apiBaseHelper.post(
      url: ApiUtil.evaluationTypeIntellectSubmitAnswerEndPoint,
      body: requestBody,
      headers: ApiUtil.headers(),
    );

    if (response.errorCode != 200) {
      throw Exception(response.errorMessage);
    }
    return response.errorMessage;
  }

  User? loggedInUser() => box.get('user');

  Future<List<EvaluationTypeIntellectResult>> findAllEvaluationTypeIntellectResult() async {
    var _user = loggedInUser();
    var response = await apiBaseHelper.get(
      url: "${ApiUtil.evaluationTypeIntellectResultEndPoint}${_user!.id}",
    );
    var list = response.response!['evaluationIntellectResponseResult'] as List;
    return list.map((e) => EvaluationTypeIntellectResult.fromJson(e)).toList();
  }
}
