import 'package:flutter/material.dart';
import 'package:my_course/screens/intro_screen.dart';
import 'package:my_course/screens/login_screen.dart';
import 'package:my_course/screens/createaccount_screen.dart';
import 'package:my_course/screens/dashboard.dart';
import 'package:my_course/screens/home_screen.dart';
import 'package:my_course/screens/my_courses.dart';
import 'package:my_course/screens/profile_screen.dart';
import 'package:my_course/screens/mobile_screen.dart';
import 'package:my_course/screens/interpersonalskills.dart';
import 'package:my_course/screens/certificate_screen.dart';
import 'package:my_course/screens/e_business.dart';
import 'package:my_course/screens/news_screen.dart';
import 'package:my_course/screens/addcourse_screen.dart';

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
        '/home-screen': (context) => HomeScreen(),
        '/my-courses': (context) => const MyCourses(),
        '/profile-screen': (context) => const ProfileScreen(),
        '/mobile-screen': (context) => const MobileScreen(),
        '/interpersonal-skills': (context) => const InterpersonalSkills(),
        '/certificate-screen': (context) => const CertificateScreen(),
        '/e-business': (context) => const EBusiness(),
        '/news-screen': (context) => const NewsScreen(),
        '/add-course': (context) => const AddCourse(),
      },
    );
  }
}
