import 'package:sa_cooperation/clients/api_clients/api_base_helper.dart';
import 'package:sa_cooperation/models/assesments.dart';
import '../../utils/api_util.dart';

class AssesmentApiClient {
  final ApiBaseHelper apiBaseHelper;
  AssesmentApiClient(this.apiBaseHelper);

  Future<List<Assesment>> findAllAssesment() async {
    var response = await apiBaseHelper.get(
      url: ApiUtil.assesmentEndPoint,
    );
    var list = response.response!['assesmentList'] as List;
    return list.map((e) => Assesment.fromJson(e)).toList();
  }

  Future<String> submitAssesmentRequest(Map<String, dynamic> requestBody) async {
    var response = await apiBaseHelper.post(
      url: '${ApiUtil.assesmentCreateEndPoint}',
      body: requestBody,
      headers: ApiUtil.headers(),
    );

    if (response.errorCode != 200) {
      throw new Exception(response.errorMessage);
    }
    return response.errorMessage;
  }
}
