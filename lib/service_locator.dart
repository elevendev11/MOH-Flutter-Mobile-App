import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:sa_cooperation/blocs/assesment_bloc.dart/assesment_bloc.dart';
import 'package:sa_cooperation/blocs/authentication-bloc/authentication_bloc.dart';
import 'package:sa_cooperation/blocs/evaluation_mind_question_result_bloc/evaluation_mind_question_result_bloc.dart';
import 'package:sa_cooperation/blocs/evaluation_mind_result_bloc/question_mind_result.dart';
import 'package:sa_cooperation/blocs/evaluation_type_intellect/evaluation_type_intellect_bloc.dart';
import 'package:sa_cooperation/blocs/evaluation_type_intellect_bloc/evaluation_type_intellect_result_bloc.dart';
import 'package:sa_cooperation/blocs/evaluation_type_mind/evaluation_type_mind.dart';
import 'package:sa_cooperation/blocs/happiness-index-bloc/happiness_index_bloc.dart';
import 'package:sa_cooperation/blocs/happiness_index_line_chart_bloc/happiness_index_line_chart_bloc.dart';
import 'package:sa_cooperation/blocs/happiness_index_question_result_bloc/happiness_index_question_result_bloc.dart';
import 'package:sa_cooperation/blocs/happiness_index_result_bloc/happiness_index_result.dart';
import 'package:sa_cooperation/blocs/login-bloc/login_bloc.dart';
import 'package:sa_cooperation/blocs/success-index-bloc/success_index_bloc.dart';
import 'package:sa_cooperation/blocs/success_index_line_chart_bloc/success_index_line_chart_bloc.dart';
import 'package:sa_cooperation/blocs/success_index_question_result_bloc/success_index_question_result.dart';
import 'package:sa_cooperation/blocs/success_index_result_bloc/success_index_result_bloc.dart';
import 'package:sa_cooperation/clients/api_clients/api_base_helper.dart';
import 'package:sa_cooperation/clients/api_clients/assesment_api_client.dart';
import 'package:sa_cooperation/clients/api_clients/evaluation_type_intellect_api_client.dart';
import 'package:sa_cooperation/clients/api_clients/evaluation_type_mind_api_client.dart';
import 'package:sa_cooperation/clients/api_clients/happiness_index_api_client.dart';
import 'package:sa_cooperation/clients/api_clients/log_api_client.dart';
import 'package:sa_cooperation/clients/api_clients/login_api_client.dart';
import 'package:sa_cooperation/clients/api_clients/notification_api_clients.dart';
import 'package:sa_cooperation/clients/api_clients/success_index_api_client.dart';
import 'package:sa_cooperation/clients/api_clients/user_api_client.dart';
import 'package:sa_cooperation/repositories/assesment_repository.dart';
import 'package:sa_cooperation/repositories/evaluation_type_intellect.dart';
import 'package:sa_cooperation/repositories/evaluation_type_mind_repository.dart';
import 'package:sa_cooperation/repositories/happiness_index_repository.dart';
import 'package:sa_cooperation/repositories/log_repository.dart';
import 'package:sa_cooperation/repositories/login_repository.dart';
import 'package:sa_cooperation/repositories/notification_repository.dart';
import 'package:sa_cooperation/repositories/success_index_repository.dart';
import 'package:sa_cooperation/repositories/user_repository.dart';

import 'blocs/transaction-bloc/transaction_bloc.dart';
import 'models/user.dart';

final GetIt locator = GetIt.instance;

Future<void> registerLocator() async {
  //Register Hive User Box
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter<User>(UserAdapter());

  var userBox = await Hive.openBox<User>('user',
      compactionStrategy: (int total, int deleted) {
    return deleted > 20;
  });

  userBox = Hive.box('user');
  locator.registerLazySingleton(() => userBox);

  //Register Data Sources
  locator.registerLazySingleton<ApiBaseHelper>(() => ApiBaseHelper(locator()));

  locator.registerLazySingleton(() => LoginApiClient(locator(), locator()));
  locator.registerLazySingleton(() => UserApiClient(locator(), locator()));
  locator.registerLazySingleton(() => NotificationApiClient(locator()));
  locator.registerLazySingleton(() => AssesmentApiClient(locator()));
  locator
      .registerLazySingleton(() => SuccessIndexApiClient(locator(), locator()));
  locator.registerLazySingleton(
      () => HappinessIndexApiClient(locator(), locator()));
  locator.registerLazySingleton(
      () => EvaluationTypeIntellectApiClient(locator(), locator()));
  locator.registerLazySingleton(
      () => EvaluationTypeMindApiClient(locator(), locator()));
        locator.registerLazySingleton(
      () => LogApiClient(locator(), locator()));

  //Register Repositories

  locator.registerLazySingleton(() => LoginRepository(locator()));
  locator.registerLazySingleton(() => UserRepository(locator()));
  locator.registerLazySingleton(() => NotificationRepository(locator()));
  locator.registerLazySingleton(() => AssesmentRepository(locator()));
  locator.registerLazySingleton(() => SuccessIndexRepository(locator()));
  locator.registerLazySingleton(() => HappinessIndexRepository(locator()));
  locator.registerLazySingleton(
      () => EvaluationTypeIntellectRepository(locator()));
  locator.registerLazySingleton(() => EvaluationTypeMindRepository(locator()));
  locator.registerLazySingleton(() => LogRepository(locator()));

  //Register Blocs
  locator.registerLazySingleton(() => AuthenticationBloc(locator()));
  locator.registerLazySingleton(() => LoginBloc(locator()));
  locator.registerLazySingleton(() => TransactionBloc(
      locator(), locator(), locator(), locator(), locator(), locator()));
  locator.registerLazySingleton(() => AssesmentBloc(locator()));
  locator.registerLazySingleton(() => SuccessIndexBloc(locator()));
  locator.registerLazySingleton(() => HappinessIndexBloc(locator()));
  locator.registerLazySingleton(() => EvaluationTypeIntellectBloc(locator()));
  locator.registerLazySingleton(() => EvaluationTypeMindBloc(locator()));
  locator.registerLazySingleton(() => SuccessIndexResultBloc(locator()));
  locator
      .registerLazySingleton(() => EvaluationMindQuestionResultBloc(locator()));
  locator.registerLazySingleton(() => EvaluationMindResultBloc(locator()));
  locator.registerLazySingleton(() => SuccessIndexLineChartBloc(locator()));
  locator.registerLazySingleton(
      () => EvaluationTypeIntellectResultBloc(locator()));
  locator.registerLazySingleton(() => HappinessIndexResultBloc(locator()));
  locator.registerLazySingleton(() => HappinessIndexLineChartBloc(locator()));
  locator
      .registerLazySingleton(() => SuccessIndexQuestionResultBloc(locator()));
  locator
      .registerLazySingleton(() => HappinessIndexQuestionResultBloc(locator()));

  locator.registerLazySingleton(() => http.Client());
}
