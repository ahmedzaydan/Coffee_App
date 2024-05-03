import 'package:caffeine_connect/core/di.dart';
import 'package:caffeine_connect/core/utils/routes_manager.dart';
import 'package:caffeine_connect/core/utils/theme_manager.dart';
import 'package:caffeine_connect/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CaffeineConnect extends StatelessWidget {
  const CaffeineConnect({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => instance<AuthCubit>()),
      ],
      child: MaterialApp.router(
        routerConfig: RoutesManager.router,
        theme: ThemeManager.lightTheme,
        debugShowCheckedModeBanner: false,
      ),

      // child: const MaterialApp(home: MenuView()),
    );
  }
}
