import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_course/screens/biodata_screen.dart';
import 'package:my_course/screens/certificate_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 2,
        child: Scaffold(
            // appBar: AppBar(
            body: Column(
          children: [
            SizedBox(height: 110),
            TabBar(tabs: [
              Tab(//index 0
                icon: Column(
                  children: [
                    Icon(Icons.person),
                    Text('Biodata'),
                  ],
                ),
              ),
              Tab(//index 1
                icon: Column(
                  children: [
                    Icon(Icons.book),
                    Text('Certificate'),
                  ],
                ),
              ),
            ]),
            Expanded(
                child: TabBarView(children: [
              BiodataScreen(), //index 0
              CertificateScreen(), //index 1
            ]))
          ],
        )));
  }
}
