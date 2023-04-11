import 'package:sa_cooperation/clients/api_clients/evaluation_type_intellect_api_client.dart';
import 'package:sa_cooperation/models/evaluation_type_intellect.dart';
import 'package:sa_cooperation/models/evaluation_type_intellect_result.dart';

class EvaluationTypeIntellectRepository {
  final EvaluationTypeIntellectApiClient apiClient;
  EvaluationTypeIntellectRepository(this.apiClient);

  Future<List<EvaluationTypeIntellect>> findAllEvaluationTypeIntellect() {
    return apiClient.findAllEvaluationTypeIntellect();
  }

  Future<String> submitEvaluationTypeIntellect(Map<String, dynamic> requestBody) {
    return apiClient.submitEvaluationTypeIntellect(requestBody);
  }

    Future<List<EvaluationTypeIntellectResult>> findAllEvaluationTypeIntellectResult() {
    return apiClient.findAllEvaluationTypeIntellectResult();
  }

  
}
