import 'dart:io';

import 'package:flutter/material.dart';
import 'package:home_automation_system/Utils/SharedPrefService.dart';
import 'package:home_automation_system/Views/HomePage/HomePage.dart';

import 'Utils/Constants.dart';
import 'Views/Onboard/OnboardPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final sharedPreferences = SharedPrefService.pref;
  @override
  Widget build(BuildContext context) {
    final isLoggedIn = sharedPreferences.getBool(Constants.IS_LOGGEDIN);
    return MaterialApp(
      title: 'Home Automation System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isLoggedIn! ? const HomePage() : const OnboardPage(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
