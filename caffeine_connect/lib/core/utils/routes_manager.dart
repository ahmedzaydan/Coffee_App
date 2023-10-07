import 'package:caffeine_connect/features/splash/presentation/views/welcome_view.dart';
import 'package:go_router/go_router.dart';

abstract class RoutesManager {
  static const String welcomeView = '/';
  static const String splashView = '/splash';
  static const String loginView = '/login';
  static const String signUpView = '/signUp';
  static const String forgotPasswordView = '/forgotPassword';
  static const String verificationView = '/verification';
  static const String menuView = '/menu';
  static const String orderOptions = '/orderOptions';
  static const String orderOptionsAssistance = '/orderOptionsAssistance';
  static const String chooseBaristaView = '/chooseBarista';
  static const String coffeeCountry = '/coffeeCountry';
  static const String coffeeSortView = '/coffeeSort';
  static const String ordersView = '/orders';
  static const String paymentView = '/payment';
  static const String profileView = '/profile';

  static final router = GoRouter(
    routes: [
      // splash screen
      GoRoute(
        path: welcomeView,
        builder: (context, state) => const WelcomeView(),
      ),
    ],
  );
}
