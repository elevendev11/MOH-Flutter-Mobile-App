import 'package:sa_cooperation/clients/api_clients/success_index_api_client.dart';
import 'package:sa_cooperation/models/success_index.dart';
import 'package:sa_cooperation/models/success_index_line_chart.dart';
import 'package:sa_cooperation/models/success_index_question_result.dart';
import 'package:sa_cooperation/models/success_index_result.dart';

class SuccessIndexRepository {
  final SuccessIndexApiClient apiClient;
  SuccessIndexRepository(this.apiClient);

  Future<List<SuccessIndex>> findAllSuccessIndex() {
    return apiClient.findAllSuccessIndex();
  }

  Future<String> submitSuccessIndex(Map<String, dynamic> requestBody) {
    return apiClient.submitSuccessIndex(requestBody);
  }


  Future<List<SuccessResult>> findSuccessIndexResult() {
    return apiClient.findSuccessIndexResult();
  }

    Future<List<SuccessIndexLineChart>> findSuccessIndexLineChartResult() {
    return apiClient.fetchsuccessIndexLineChartResponseList();
  }


    Future<List<SuccessIndexQuestionResult>> findSuccessIndexQuestionResult() {
    return apiClient.findSuccessIndexQuestionResult();
  }

  
}
