import 'package:caffeine_connect/features/auth/presentation/views/forgot_password_view.dart';
import 'package:caffeine_connect/features/auth/presentation/views/login_view.dart';
import 'package:caffeine_connect/features/auth/presentation/views/register_view.dart';
import 'package:caffeine_connect/features/auth/presentation/views/verification_view.dart';
import 'package:caffeine_connect/features/order/presentation/views/menu_view.dart';
import 'package:caffeine_connect/features/splash/presentation/views/splash_view.dart';
import 'package:caffeine_connect/features/splash/presentation/views/welcome_view.dart';
import 'package:go_router/go_router.dart';

abstract class RoutesManager {
  // TODO: swap welcome and menu
  // static const String welcomeView = '/';
  static const String welcomeView = '/welcomeView'; // TODO: swap
  static const String splashView = '/splash';
  static const String loginView = '/login';
  static const String registerView = '/register';
  static const String forgotPasswordView = '/forgotPassword';
  static const String verificationView = '/verification';
  // static const String menuView = '/menu';
  static const String menuView = '/'; // TODO: swap
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
      // welcome screen
      GoRoute(
        path: welcomeView,
        builder: (context, state) => const WelcomeView(),
      ),

      // login screen
      GoRoute(
        path: loginView,
        builder: (context, state) => const LoginView(),
      ),

      // forgot password screen
      GoRoute(
        path: forgotPasswordView,
        builder: (context, state) => ForwardPasswordView(),
      ),

      // sign up screen
      GoRoute(
        path: registerView,
        builder: (context, state) => const RegisterView(),
      ),

      // verification screen
      GoRoute(
        path: verificationView,
        builder: (context, state) => const VerificationView(),
      ),

      // splash screen
      GoRoute(
        path: splashView,
        builder: (context, state) => const SplashView(),
      ),

      // menu screen
      GoRoute(
        path: menuView,
        builder: (context, state) => const MenuView(),
      ),
    ],
  );
}
