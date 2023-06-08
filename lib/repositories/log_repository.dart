import 'package:sa_cooperation/clients/api_clients/log_api_client.dart';
import 'package:sa_cooperation/models/log_response.dart';

class LogRepository {
  final LogApiClient apiClient;
  LogRepository(this.apiClient);
  Future<LogResponse> findAllLogs() {
    return apiClient.findAllLogs();
  }
}
