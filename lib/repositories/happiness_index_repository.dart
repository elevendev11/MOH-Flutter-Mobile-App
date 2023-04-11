import 'package:sa_cooperation/clients/api_clients/happiness_index_api_client.dart';
import 'package:sa_cooperation/models/happiness_index.dart';
import 'package:sa_cooperation/models/happiness_index_line_chart.dart';
import 'package:sa_cooperation/models/happiness_index_question_result.dart';
import 'package:sa_cooperation/models/happiness_index_result.dart';

class HappinessIndexRepository {
  final HappinessIndexApiClient apiClient;
  HappinessIndexRepository(this.apiClient);

  Future<List<HappinessIndex>> findAllHappinessIndex() {
    return apiClient.findAllHappinessIndex();
  }

  Future<String> submitHappinessIndex(Map<String, dynamic> requestBody) {
    return apiClient.submitHappinessIndex(requestBody);
  }

  Future<List<HappinessIndexResult>> findAllHappinessIndexResult() {
    return apiClient.findAllHappinessIndexResult();
  }

  Future<List<HappinessIndexLineChart>> findAllHappinessIndexLineChartResult() {
    return apiClient.findAllHappinessIndexLineChartResult();
  }

   Future<List<HappinessIndexQuestionResult>> findAllHappinessIndexQuestionResult() {
    return apiClient.findAllHappinessIndexQuestionResult();
  } 
}
