import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:se7ety/core/routes/app_router.dart';
import 'package:se7ety/core/style/colors.dart';

class Se7ety extends StatelessWidget {
  const Se7ety({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      
      routerConfig: AppRouter.routes,

      locale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
      ],

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: AppColors.bgColor,

        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.bgColor,
          elevation: 0,
        ),
      ),
    );
  }
}