import 'package:flutter/material.dart';
import 'package:event_reminder_app/screens/onboarding_screen.dart';
import 'package:event_reminder_app/screens/dashboard_screen.dart';
import 'package:event_reminder_app/screens/task_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Reminder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto', // Defaulting to Roboto, can be changed if assets are added
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00B074),
          primary: const Color(0xFF00B074),
          surface: Colors.white,

        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          iconTheme: IconThemeData(color: Colors.black87),
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/tasks': (context) => const TaskListScreen(),
      },
    );
  }
}
