
import 'package:sa_cooperation/clients/api_clients/assesment_api_client.dart';
import 'package:sa_cooperation/models/assesments.dart';

class AssesmentRepository {
  final AssesmentApiClient apiClient;
  AssesmentRepository(this.apiClient);

  Future<List<Assesment>> findAllAssesment() {
    return apiClient.findAllAssesment();
  }

    Future<String> createAssesmentRequest(Map<String, dynamic> requestBody) {
    return apiClient.submitAssesmentRequest(requestBody);
  }
}