import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:my_course/screens/intro_screen.dart';
import 'package:my_course/screens/login_screen.dart';
import 'package:my_course/screens/createaccount_screen.dart';
import 'package:my_course/screens/dashboard.dart';
import 'package:my_course/screens/home_screen.dart';
import 'package:my_course/screens/my_courses.dart';
import 'package:my_course/screens/profile.dart';
import 'package:my_course/screens/mobile_screen.dart';
import 'package:my_course/screens/interpersonalskills.dart';
import 'package:my_course/screens/certificate_screen.dart';
import 'package:my_course/screens/e_business.dart';
import 'package:my_course/screens/news_screen.dart';
import 'package:my_course/screens/addcourse_screen.dart';
import 'package:my_course/utils/constants.dart';

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
        '/login-screen': (context) =>
            const LoginScreen(), //define route or navigation each screens
        '/create-account': (context) => const CreateAccount(),
        '/dashboard': (context) => Dashboard(),
        '/home-screen': (context) => HomeScreen(),
        '/my-courses': (context) => const MyCourses(),
        '/profile': (context) => const ProfileScreen(),
        '/mobile-screen': (context) => const MobileScreen(),
        '/interpersonal-skills': (context) => const InterpersonalSkills(),
        '/certificate-screen': (context) => const CertificateScreen(),
        '/e-business': (context) => const EBusiness(),
        '/news-screen': (context) => const NewsScreen(),
        '/add-course': (context) => const AddCourse(),
        '/my-homepage': (context) => MyHomePage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int activeIndex =
      0; //var use to save active screen index, initialize by 0 meanns that the fisrt screen in list  screens is set as default.
  // int _selectedIndex = 0;

  final List<Widget> screens = [
    //a list of widget objects that represent the various screens available in the application.
    Dashboard(), //index 0
    const MyCourses(), //index 1
    const ProfileScreen(), //index 2
  ];

  // void _onItemTapped(int index) {//method called when user on tap item in navigation
  //   setState(() {//to update the state index
  //     activeIndex = index;//active index will updated according to the idex selected
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: null,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme:
              const IconThemeData(color: Colors.purple), // recolor the icon
        ),
        body: screens[activeIndex], //body akan menampilkan active index
        bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Constants.scaffoldBackgroundColor,
            buttonBackgroundColor: Constants.primaryColor,
            items: [
              Icon(
                Icons.home,
                size: 30.0,
                color: activeIndex == 0 ? Colors.white : Constants.activeMenu,
              ),
              Icon(
                Icons.book,
                size: 30.0,
                color: activeIndex == 1 ? Colors.white : Constants.activeMenu,
              ),
              Icon(
                Icons.person,
                size: 30.0,
                color: activeIndex == 2 ? Colors.white : Constants.activeMenu,
              ),
            ],
            onTap: (index) {
              setState(() {
                activeIndex = index;
              });
            }),
        drawer: Drawer(
            child: ListView(
          //is used to display a list of items in order, either vertically or horizontally.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 140, 31, 236),
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              //combination with list view to make items organized
              title: const Text('API'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewsScreen()));
              },
            ),
            ListTile(
              title: const Text('CRUD SQLITE'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddCourse()));
              },
            ),
          ],
        )));
  }
}
