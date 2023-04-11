import 'package:sa_cooperation/clients/api_clients/api_base_helper.dart';
import 'package:sa_cooperation/models/categories.dart';

import '../../utils/api_util.dart';

class NotificationApiClient {
  final ApiBaseHelper apiBaseHelper;
  NotificationApiClient(this.apiBaseHelper);
  // Future<List<PushNotification>> findAllNotification() {
  //   return Future.delayed(Duration(seconds: 5), () => notification);
  // }

  Future<List<Categories>> findAllNotification() async {
    var response = await apiBaseHelper.get(
      url: ApiUtil.categoriesEndPoint,
    );
    var list = response.response!['categoriesList'] as List;
    return list.map((e) => Categories.fromJson(e)).toList();
  }


}
