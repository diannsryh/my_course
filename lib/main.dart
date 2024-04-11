import 'package:flutter/material.dart';
import 'package:my_course/screens/intro_screen.dart';
import 'package:my_course/screens/login_screen.dart';
import 'package:my_course/screens/createaccount_screen.dart';
import 'package:my_course/screens/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const IntroScreen(),
      routes: {
        '/login-screen': (context) => const LoginScreen(),
        '/create-account': (context) => const CreateAccount(),
        '/dashboard': (context) => Dashboard(),
      },
    );
  }
}
