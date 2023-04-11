import 'package:sa_cooperation/clients/api_clients/evaluation_type_mind_api_client.dart';
import 'package:sa_cooperation/models/evaluation_mind_question_result.dart';
import 'package:sa_cooperation/models/evaluation_mind_result.dart';
import 'package:sa_cooperation/models/evaluation_type_mind.dart';

class EvaluationTypeMindRepository {
  final EvaluationTypeMindApiClient apiClient;
  EvaluationTypeMindRepository(this.apiClient);

  Future<List<EvaluationTypeMind>> findAllEvaluationTypeMind() {
    return apiClient.findAllEvaluationTypeIntellect();
  }

  Future<String> submitEvaluationTypeMind(Map<String, dynamic> requestBody) {
    return apiClient.submitEvaluationTypeMind(requestBody);
  }

  Future<List<EvaluationMindQuestionResult>> findAllEvaluationMindQuestionResult() {
    return apiClient.fetchEvaluationTypeMindQuestionResult();
  }

  Future<List<EvaluationMindResult>> findAllEvaluationMindResult() {
    return apiClient.fetchEvaluationTypeMindResult();
  }
}
