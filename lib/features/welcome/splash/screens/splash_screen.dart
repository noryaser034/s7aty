import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:se7ety/core/constants/app_images.dart';
import 'package:se7ety/core/functions/navigations.dart';
import 'package:se7ety/core/routes/routes.dart';
import 'package:se7ety/core/service/local/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      if (FirebaseAuth.instance.currentUser != null) {
        pushAndClearStack(AppRoutes.patientMain, context);
      } else if (SharedPref.isOnboardingShown()) {
        pushAndClearStack(AppRoutes.welcome, context);
      } else {
        pushAndClearStack(AppRoutes.onboarding, context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Image.asset(AppImages.logo))],
      ),
    );
  }
}
