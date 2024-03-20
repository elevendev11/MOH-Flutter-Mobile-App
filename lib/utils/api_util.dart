class ApiUtil {
  static Map<String, String> headers(
      {String? pageNumber = "",
      String? token = "",
      String? itemKey = "",
      String? authorization = ""}) {
    return Map.from({
      "Content-Type": "application/json; charset=utf-8",
      "Accept": "application/json",
      "X-PageNumber": pageNumber,
      "X-TokenId": token,
      "X-ItemKey": itemKey,
      "Authorization": authorization,
    });
  }

  static const String _baseUrlV1 = 'http://aliz31.sg-host.com';

  static const String _saBaseUrlV1 = '$_baseUrlV1/api';
  static const String loginEndPoint = '$_saBaseUrlV1/login';
  static const String deleteUserEndPoint = '$_saBaseUrlV1/deleteuser';
  static const String registerEndPoint = '$_saBaseUrlV1/register';
  static const String logoutEndPoint = '$_saBaseUrlV1/logout';
  static const String updateUserEndPoint = '$_saBaseUrlV1/update_user/';
  static const String categoriesEndPoint = '$_saBaseUrlV1/categories';
  static const String assesmentEndPoint = '$_saBaseUrlV1/assesments';
  static const String assesmentCreateEndPoint =
      '$_saBaseUrlV1/assesment_answer';
  static const String successIndexEndPoint =
      '$_saBaseUrlV1/fetch_success_index/';
  static const String happinessIndexEndPoint =
      '$_saBaseUrlV1/fetch_happiness_index/';
  static const String happinessIndexResultEndPoint =
      '$_saBaseUrlV1/happiness_index_result/';
  static const String happinessIndexLineChartResponse =
      '$_saBaseUrlV1/happiness_index_line_chart_response/';
  static const String evaluationTypeIntellectEndPoint =
      '$_saBaseUrlV1/fetch_evaluation_type_intellect/';
  static const String evaluationTypeIntellectResultEndPoint =
      '$_saBaseUrlV1/evaluation_type_intellect_result/';
  static const String evaluationTypeMindEndPoint =
      '$_saBaseUrlV1/fetch_evaluation_type_mind/';
  static const String successIndexSubmitAnswerEndPoint =
      '$_saBaseUrlV1/success_index_answer';
  static const String happinessIndexSubmitAnswerEndPoint =
      '$_saBaseUrlV1/happiness_index_answer';
  static const String evaluationTypeIntellectSubmitAnswerEndPoint =
      '$_saBaseUrlV1/evaluation_type_intellect_answer';
  static const String evaluationTypeMindSubmitAnswerEndPoint =
      '$_saBaseUrlV1/evaluation_type_mind_answer';
  static const String successIndexResultEndPoint =
      '$_saBaseUrlV1/success_index_result/';
  static const String evaluationTypeMindResultEndPoint =
      '$_saBaseUrlV1/evaluation_type_mind_result/';
  static const String evaluationTypeMindQuestionResultEndPoint =
      '$_saBaseUrlV1/evaluation_type_mind_question_result/';
  static const String successIndexLineChartResponse =
      '$_saBaseUrlV1/success_index_line_chart_response/';
  static const String successIndexQuestionResult =
      '$_saBaseUrlV1/success_index_low_question_analytics/';
  static const String happinessIndexQuestionResult =
      '$_saBaseUrlV1/happiness_index_low_question_analytics/';
  static const String logsEndPoint = '$_saBaseUrlV1/logs/';

  static const String profileImageEndPoint = '$_baseUrlV1/public/storage/users';
}
