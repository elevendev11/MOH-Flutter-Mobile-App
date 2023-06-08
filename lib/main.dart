import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa_cooperation/blocs/assesment_bloc.dart/assesment_bloc.dart';
import 'package:sa_cooperation/blocs/evaluation_mind_question_result_bloc/evaluation_mind_question_result_bloc.dart';
import 'package:sa_cooperation/blocs/evaluation_mind_result_bloc/evaluation_mind_result_bloc.dart';
import 'package:sa_cooperation/blocs/evaluation_type_intellect/evaluation_type_intellect_bloc.dart';
import 'package:sa_cooperation/blocs/evaluation_type_intellect_bloc/evaluation_type_intellect_result_bloc.dart';
import 'package:sa_cooperation/blocs/evaluation_type_mind/evaluation_type_mind_bloc.dart';
import 'package:sa_cooperation/blocs/happiness-index-bloc/happiness_index_bloc.dart';
import 'package:sa_cooperation/blocs/happiness_index_line_chart_bloc/happiness_index_line_chart_bloc.dart';
import 'package:sa_cooperation/blocs/happiness_index_result_bloc/happiness_index_result_bloc.dart';
import 'package:sa_cooperation/blocs/sc_bloc_delegate.dart';
import 'package:sa_cooperation/blocs/success-index-bloc/success_index_bloc.dart';
import 'package:sa_cooperation/blocs/success_index_line_chart_bloc/success_index_line_chart_bloc.dart';
import 'package:sa_cooperation/blocs/success_index_question_result_bloc/success_index_question_result_bloc.dart';
import 'package:sa_cooperation/blocs/success_index_result_bloc/success_index_result_bloc.dart';
import 'package:sa_cooperation/repositories/log_repository.dart';
import 'package:sa_cooperation/service_locator.dart';
import 'package:sa_cooperation/utils/routes.dart';
import 'package:sa_cooperation/utils/sa_router.dart';
import 'package:sa_cooperation/utils/style.dart';

import 'blocs/authentication-bloc/authentication_bloc.dart';
import 'blocs/authentication-bloc/authentication_event.dart';
import 'blocs/authentication-bloc/authentication_state.dart';
import 'blocs/happiness_index_question_result_bloc/happiness_index_question_result.dart';
import 'blocs/login-bloc/login.dart';
import 'blocs/transaction-bloc/transaction_bloc.dart';
import 'repositories/login_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await registerLocator();
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: SCBlocDelegate(),
  );
  // Bloc.observer = SCBlocDelegate();

  // runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => locator<LoginRepository>()),
        RepositoryProvider(create: (_) => locator<LogRepository>())
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider(
            create: (_) => locator<AuthenticationBloc>()..add(AppStarted())),
        BlocProvider(create: (_) => locator<TransactionBloc>()),
        BlocProvider(create: (_) => locator<LoginBloc>()),
        BlocProvider(create: (_) => locator<AssesmentBloc>()),
        BlocProvider(create: (_) => locator<SuccessIndexBloc>()),
        BlocProvider(create: (_) => locator<HappinessIndexBloc>()),
        BlocProvider(create: (_) => locator<EvaluationTypeIntellectBloc>()),
        BlocProvider(create: (_) => locator<EvaluationTypeMindBloc>()),
        BlocProvider(create: (_) => locator<SuccessIndexResultBloc>()),
        BlocProvider(
            create: (_) => locator<EvaluationMindQuestionResultBloc>()),
        BlocProvider(create: (_) => locator<EvaluationMindResultBloc>()),
        BlocProvider(create: (_) => locator<SuccessIndexLineChartBloc>()),
        BlocProvider(
            create: (_) => locator<EvaluationTypeIntellectResultBloc>()),
        BlocProvider(create: (_) => locator<HappinessIndexResultBloc>()),
        BlocProvider(create: (_) => locator<HappinessIndexLineChartBloc>()),
        BlocProvider(create: (_) => locator<SuccessIndexQuestionResultBloc>()),
        BlocProvider(
            create: (_) => locator<HappinessIndexQuestionResultBloc>()),
      ], child: const HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SA Cooperation',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 229, 239, 251),
        brightness: Brightness.light,
        textTheme: Style.textTheme,
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          color: Colors.white,
          titleTextStyle: Style.bodyText1.copyWith(
            color: Style.primaryColor,
          ),
          centerTitle: true,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Style.primaryColor,
        ),
      ),
      navigatorKey: _navigatorKey,
      onGenerateRoute: SARouter.generateRoute,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationAuthenticated) {
              if (state.user.assesmentStatus == 1) {
                _navigator.pushNamedAndRemoveUntil(
                    homeScreenRoute, (route) => false);
              } else {
                _navigator.pushNamedAndRemoveUntil(
                    assesmentScreenRoute, (route) => false);
              }
            } else if (state is AuthenticationUnauthenticated) {
              _navigator.pushNamedAndRemoveUntil(
                  splashScreenRoute, (route) => false);
            }
          },
          child: child,
        );
      },
    );
  }
}
