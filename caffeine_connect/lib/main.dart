import 'package:caffeine_connect/core/utils/routes_manager.dart';
import 'package:caffeine_connect/core/utils/theme_manager.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(const CaffeineConnect());
}

class CaffeineConnect extends StatelessWidget {
  const CaffeineConnect({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RoutesManager.router,
      theme: ThemeManager.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
