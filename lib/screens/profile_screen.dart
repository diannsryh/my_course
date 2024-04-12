import 'package:flutter/material.dart';
import 'package:my_course/screens/biodata_screen.dart';
import 'package:my_course/screens/certificate_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  void goToAnotherRoute(context, screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Column(
                    children: [
                      Icon(Icons.person),
                      Text('Biodata'),
                    ],
                  ),
                ),
                Tab(
                  icon: Column(
                    children: [
                      Icon(Icons.book),
                      Text('Certificate'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(children: [
            BiodataScreen(), //index 0
            CertificateScreen(), //index 1
          ]),
        ));
  }
}
