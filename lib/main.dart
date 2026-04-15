import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:se7ety/app.dart';
import 'package:se7ety/core/services/local/shared_pref.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedPref.init();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('ar'),
      child: const MainApp(),
    ),
  );
}

