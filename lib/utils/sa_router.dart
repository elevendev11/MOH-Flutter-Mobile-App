import 'package:flutter/material.dart';
import 'package:sa_cooperation/screens/happiness_index_question_result_screen.dart';
import 'package:sa_cooperation/screens/success_index_question_result_screen.dart';
import 'package:sa_cooperation/screens/assessment_screen.dart';
import 'package:sa_cooperation/screens/brain_analytics_screen.dart';
import 'package:sa_cooperation/screens/dashboard_screen.dart';
import 'package:sa_cooperation/screens/edit_profile_screen.dart';
import 'package:sa_cooperation/screens/evaluation_intellect_history_option_screen.dart';
import 'package:sa_cooperation/screens/evaluation_mind_history_screen.dart';
import 'package:sa_cooperation/screens/evaluation_type_intellect_screen.dart';
import 'package:sa_cooperation/screens/evaluation_type_mind_screen.dart';
import 'package:sa_cooperation/screens/happiness_bar_graph_screen.dart';
import 'package:sa_cooperation/screens/happiness_commulative_history_screen.dart';
import 'package:sa_cooperation/screens/happiness_history_option_screen.dart';
import 'package:sa_cooperation/screens/happiness_index_screen.dart';
import 'package:sa_cooperation/screens/success_commulative_history_screen.dart';
import 'package:sa_cooperation/screens/success_history_option_screen.dart';
import 'package:sa_cooperation/screens/history_screen.dart';
import 'package:sa_cooperation/screens/home_screen.dart';
import 'package:sa_cooperation/screens/information_screen.dart';
import 'package:sa_cooperation/screens/invite_screen.dart';
import 'package:sa_cooperation/screens/journey_screen.dart';
import 'package:sa_cooperation/screens/line_graph_screen.dart';
import 'package:sa_cooperation/screens/privacy_policy_screen.dart';
import 'package:sa_cooperation/screens/rotated_bar_chart_screen.dart';
import 'package:sa_cooperation/screens/signup_screen.dart';
import 'package:sa_cooperation/screens/success_index_screen.dart';

import '../screens/get_started_screen.dart';
import '../screens/login_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/success_bar_graph_screen.dart';
import '../screens/walk_through_screen.dart';
import 'routes.dart';

class SARouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case walkThroughScreenRoute:
        return MaterialPageRoute(builder: (_) => const WalkThroughScreen());
      case loginScreenRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case dashboardScreenRoute:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case journeyScreenRoute:
        return MaterialPageRoute(builder: (_) => const JourneyScreen());
      case historyScreenRoute:
        return MaterialPageRoute(builder: (_) => const HistoryScreen());
      case assesmentScreenRoute:
        return MaterialPageRoute(builder: (_) => const AssessmentScreen());
      case successIndexScreenRoute:
        return MaterialPageRoute(builder: (_) => SuccessIndexScreen());
      case happinessIndexScreenRoute:
        return MaterialPageRoute(builder: (_) => HappinessIndexScreen());
      case evaluationTypeIntellectScreenRoute:
        return MaterialPageRoute(builder: (_) => EvaluationTypeIntellectScreen());
      case evaluationTypeMindScreenRoute:
        return MaterialPageRoute(builder: (_) => EvaluationTypeMindScreen());
      case successBarChartScreenRoute:
        return MaterialPageRoute(builder: (_) => const SuccessBarGraphScreen());
      case happinessBarChartScreenRoute:
        return MaterialPageRoute(builder: (_) => const HappinessBarGraphScreen());
      case informationScreenRoute:
        return MaterialPageRoute(builder: (_) => const InformationScreen());
      case homeScreenRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case getStartedScreenRoute:
        return MaterialPageRoute(builder: (_) => const GetStartedScreen());
      case editProfileScreenRoute:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case signupScreenRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case privacyPolicyScreenRoute:
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen());
      case inviteScreenRoute:
        return MaterialPageRoute(builder: (_) => const InviteScreen());

      case lineGraphChartRoute:
        return MaterialPageRoute(builder: (_) => const LineGraphScreen());
      case brainAnalyticsScreenRoute:
        return MaterialPageRoute(builder: (_) => const BrainAnalyticsScreen());
      case evaluationTypeIntellectResultScreenRoute:
        return MaterialPageRoute(builder: (_) => const RotatedBarChartScreen());
      case successIndexQuestionResultScreenRoute:
        return MaterialPageRoute(builder: (_) => const SuccessIndexQuestionResultScreen());
      case happinessIndexQuestionResultScreenRoute:
        return MaterialPageRoute(builder: (_) => const HappinessIndexQuestionResultScreen());
      case successHistoryOptionScreenRoute:
        return MaterialPageRoute(builder: (_) => const SuccessHistoryOptionScreen());
      case happinessHistoryOptionScreenRoute:
        return MaterialPageRoute(builder: (_) => const HappinessHistoryOptionScreen());
      case evaluationIntellectHistoryOptionScreenRoute:
        return MaterialPageRoute(builder: (_) => const EvaluationIntellectHistoryOptionScreen());
      case evaluationMindHistoryOptionScreenRoute:
        return MaterialPageRoute(builder: (_) => const EvaluationMindHistoryOptionScreen());
      case successIndexCommulativeScreenRoute:
        return MaterialPageRoute(builder: (_) => const SuccessIndexCommulativeScreen());
      case happinessCommulativeHistoryScreenRoute:
        return MaterialPageRoute(builder: (_) => const HappinessCommulativeHistoryScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(isRouteToWalkThrough: false),
        );
    }
  }
}
