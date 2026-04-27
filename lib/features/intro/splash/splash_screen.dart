// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:se7ety/core/constants/app_images.dart';
import 'package:se7ety/core/routes/navigations.dart';
import 'package:se7ety/core/routes/routes.dart';
import 'package:se7ety/core/services/local/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    bool isOnboardingShown = SharedPref.isOnboardingShown();
    bool isLoggedIn = SharedPref.getUserID().isNotEmpty == true;
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (isLoggedIn) {
        pushReplacement(context, Routes.patientMainApp);
      } else if (isOnboardingShown) {
        pushReplacement(context, Routes.welcome);
      } else {
        pushReplacement(context, Routes.onboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AppImages.logo, width: 250)),
    );
  }
}
