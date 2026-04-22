import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:se7ety/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:se7ety/features/auth/presentation/screens/login/login_screen.dart';
import 'package:se7ety/features/auth/presentation/screens/register/register_screen.dart';
import 'package:se7ety/features/home/presentation/screens/patient_home_screen.dart';
import 'package:se7ety/features/main/patient_main_app_screen.dart';
import 'package:se7ety/features/welcome/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:se7ety/features/welcome/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'package:se7ety/features/welcome/splash/screens/splash_screen.dart';
import 'package:se7ety/features/welcome/welcome/screens/welcome_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String patientMain = '/patientMain';
  static const String patientHome = '/patientHome';

  static var routes = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashScreen()),

      GoRoute(
        path: onboarding,
        builder: (context, state) => BlocProvider(
          create: (context) => OnBoardingCubit(),
          child: const OnBoardingScreen(),
        ),
      ),

      GoRoute(
        path: welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),

      GoRoute(
        path: register,
        builder: (context, state) {
          final userType = state.extra as String? ?? 'دكتور';
          return BlocProvider(
            create: (context) => AuthCubit(),
            child: RigesterScreen(user: userType),
          );
        },
      ),

      GoRoute(
        path: login,
        builder: (context, state) {
          final userType = state.extra as String? ?? 'دكتور';
          return BlocProvider(
            create: (context) => AuthCubit(),
            child: LoginScreen(user: userType),
          );
        },
      ),

      GoRoute(
        path: patientMain,
        builder: (context, state) => const PatientMainAppScreen(),
      ),

      GoRoute(
        path: patientHome,
        builder: (context, state) => const PatientHomeScreen(),
      ),
    ],
  );
}
