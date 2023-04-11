class ApiUtil {
  static Map<String, String> headers({String? pageNumber = "", String? token = "", String? itemKey = "", String? authorization = ""}) {
    return Map.from({
      "Content-Type": "application/json; charset=utf-8",
      "Accept": "application/json",
      "X-PageNumber": pageNumber,
      "X-TokenId": token,
      "X-ItemKey": itemKey,
      "Authorization": authorization,
    });
  }

  static final String _baseUrlV1 = 'https://almaqqam.com';

  static final String _saBaseUrlV1 = '$_baseUrlV1/api';
  static final String loginEndPoint = '$_saBaseUrlV1/login';
  static final String registerEndPoint = '$_saBaseUrlV1/register';
  static final String logoutEndPoint = '$_saBaseUrlV1/logout';
  static final String updateUserEndPoint = '$_saBaseUrlV1/update_user/';
  static final String categoriesEndPoint = '$_saBaseUrlV1/categories';
  static final String assesmentEndPoint = '$_saBaseUrlV1/assesments';
  static final String assesmentCreateEndPoint = '$_saBaseUrlV1/assesment_answer';
  static final String successIndexEndPoint = '$_saBaseUrlV1/fetch_success_index/';
  static final String happinessIndexEndPoint = '$_saBaseUrlV1/fetch_happiness_index/';
  static final String happinessIndexResultEndPoint = '$_saBaseUrlV1/happiness_index_result/';
  static final String happinessIndexLineChartResponse = '$_saBaseUrlV1/happiness_index_line_chart_response/';
  static final String evaluationTypeIntellectEndPoint = '$_saBaseUrlV1/fetch_evaluation_type_intellect/';
  static final String evaluationTypeIntellectResultEndPoint = '$_saBaseUrlV1/evaluation_type_intellect_result/';
  static final String evaluationTypeMindEndPoint = '$_saBaseUrlV1/fetch_evaluation_type_mind/';
  static final String successIndexSubmitAnswerEndPoint = '$_saBaseUrlV1/success_index_answer';
  static final String happinessIndexSubmitAnswerEndPoint = '$_saBaseUrlV1/happiness_index_answer';
  static final String evaluationTypeIntellectSubmitAnswerEndPoint = '$_saBaseUrlV1/evaluation_type_intellect_answer';
  static final String evaluationTypeMindSubmitAnswerEndPoint = '$_saBaseUrlV1/evaluation_type_mind_answer';
  static final String successIndexResultEndPoint = '$_saBaseUrlV1/success_index_result/';
  static final String evaluationTypeMindResultEndPoint = '$_saBaseUrlV1/evaluation_type_mind_result/';
  static final String evaluationTypeMindQuestionResultEndPoint = '$_saBaseUrlV1/evaluation_type_mind_question_result/';
  static final String successIndexLineChartResponse = '$_saBaseUrlV1/success_index_line_chart_response/';
  static final String successIndexQuestionResult = '$_saBaseUrlV1/success_index_low_question_analytics/';
  static final String happinessIndexQuestionResult = '$_saBaseUrlV1/happiness_index_low_question_analytics/';

  static final String profileImageEndPoint = '$_baseUrlV1/storage/users';
}
