import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_course/component/assets_image_widget.dart';
import 'package:my_course/screens/interpersonalskills.dart';
import 'package:my_course/screens/mobile_screen.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({super.key});

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 13),
                    child: Text(
                      'My Courses',
                      style: GoogleFonts.kodchasan(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: const Color.fromARGB(255, 140, 31, 236),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MobileScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 7, bottom: 7, right: 7),
                  child: Ink(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 210, 229, 244),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(children: [
                      AssetImageWidget(
                          imagePath: 'assets/images/mobile3.png',
                          height: 110,
                          width: 110,
                          fit: BoxFit.fill),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Title
                          Text(
                            'Mobile Programming',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 6, 105, 187),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          //Subtitle
                          Text(
                            'Mr. Teguh & Mr. Agus',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 33, 42, 47),
                            ),
                          )
                        ],
                      ),
                    ]),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InterpersonalSkills()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 7, bottom: 7, right: 7),
                  child: Ink(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 210, 229, 244),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(children: [
                      AssetImageWidget(
                          imagePath: 'assets/images/interpersonal.png',
                          height: 110,
                          width: 110,
                          fit: BoxFit.fill),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Title
                          Text(
                            'Interpersonal Skills',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 6, 105, 187),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          //Subtitle
                          Text(
                            'Mrs. Puteri',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 33, 42, 47),
                            ),
                          )
                        ],
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
