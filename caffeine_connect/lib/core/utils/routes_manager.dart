import 'package:caffeine_connect/features/auth/presentation/views/forgot_password_view.dart';
import 'package:caffeine_connect/features/auth/presentation/views/login_view.dart';
import 'package:caffeine_connect/features/auth/presentation/views/register_view.dart';
import 'package:caffeine_connect/features/order/data/models/menu_item_model.dart';
import 'package:caffeine_connect/features/order/presentation/views/coffee_lover_assemblage_view.dart';
import 'package:caffeine_connect/features/order/presentation/views/make_order_view.dart';
import 'package:caffeine_connect/features/order/presentation/views/menu_view.dart';
import 'package:caffeine_connect/features/order/presentation/views/orders_view.dart';
import 'package:caffeine_connect/features/order/presentation/views/select_barista_view.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/coffee_lover_assemblage/additives.dart';
import 'package:caffeine_connect/features/order/presentation/views/widgets/coffee_lover_assemblage/coffee_sort.dart';
import 'package:caffeine_connect/features/splash/presentation/views/splash_view.dart';
import 'package:caffeine_connect/features/splash/presentation/views/welcome_view.dart';
import 'package:go_router/go_router.dart';

abstract class RoutesManager {
  // TODO: swap welcome and menu
  static const String welcomeView = '/';
  // static const String welcomeView = '/welcomeView'; // TODO: swap
  static const String splashView = '/splash';
  static const String loginView = '/login';
  static const String registerView = '/register';
  static const String forgotPasswordView = '/forgotPassword';
  static const String menuView = '/menu';
  static const String makeOrder = '/makeOrder';
  static const String coffeeLoverAssemblageView = '/coffeeLoverAssemblage';
  static const String selectBaristaView = '/selectBarista';
  static const String coffeeSortView = '/coffeeSort';
  static const String additvesView = '/additives';
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
        builder: (context, state) => LoginView(),
      ),

      // forgot password screen
      GoRoute(
        path: forgotPasswordView,
        builder: (context, state) => ForgotPasswordView(),
      ),

      // sign up screen
      GoRoute(
        path: registerView,
        builder: (context, state) => const RegisterView(),
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

      // make order screen
      GoRoute(
        path: makeOrder,
        builder: (context, state) =>
            MakeOrderView(item: state.extra as MenuItem),
      ),

      // coffee lover assemblage screen
      GoRoute(
        path: coffeeLoverAssemblageView,
        builder: (context, state) => const CoffeeLoverAssemblageView(),
      ),

      // select barista screen
      GoRoute(
        path: selectBaristaView,
        builder: (context, state) => const SelectBaristaView(),
      ),

      // coffee sort screen
      GoRoute(
        path: coffeeSortView,
        builder: (context, state) => const CoffeeSortView(),
      ),

      // additives screen
      GoRoute(
        path: additvesView,
        builder: (context, state) => const AdditivesView(),
      ),

      // orders screen
      GoRoute(
        path: ordersView,
        builder: (context, state) => const OrdersView(),
      ),
    ],
  );
}
