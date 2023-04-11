
import 'package:sa_cooperation/models/categories.dart';

import '../clients/api_clients/notification_api_clients.dart';

class NotificationRepository {
  final NotificationApiClient apiClient;
  NotificationRepository(this.apiClient);

  Future<List<Categories>> findAllNotification() {
    return apiClient.findAllNotification();
  }
}