// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:my_course/screens/my_courses.dart';
// import 'package:my_course/screens/profile_screen.dart';
import 'package:my_course/screens/ui_ux.dart';
import 'package:my_course/screens/ui_ux_course.dart';
import 'package:my_course/screens/ui_ux_course2.dart';
// import 'package:my_course/utils/constants.dart';
import 'package:my_course/component/assets_image_widget.dart';

var categories = [
  'UI/UX Design',
  'Web Development',
  'Data Analyst',
  'Computer network',
  'Cloud Computong'
];
var selectCategories = 0;
// import '../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Track active index
  // int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: CurvedNavigationBar(
      //     backgroundColor: Constants.scaffoldBackgroundColor,
      //     buttonBackgroundColor: Constants.primaryColor,
      //     items: [
      //       Icon(
      //         Icons.home,
      //         size: 30.0,
      //         color: activeIndex == 0 ? Colors.white : Constants.activeMenu,
      //       ),
      //       Icon(
      //         Icons.book,
      //         size: 30.0,
      //         color: activeIndex == 1 ? Colors.white : Constants.activeMenu,
      //       ),
      //       Icon(
      //         Icons.person,
      //         size: 30.0,
      //         color: activeIndex == 2 ? Colors.white : Constants.activeMenu,
      //       ),
      //     ],
      //     onTap: (index) {
      //       setState(() {
      //         activeIndex = index;
      //       });
      //     }),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hello Dian!',
                          style: GoogleFonts.kodchasan(
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            color: const Color.fromARGB(255, 140, 31, 236),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.menu,
                              size: 30,
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Text('Course Recomendation',
                            style: GoogleFonts.kumbhSans(
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                //bisa direplace pakai container
                height: 165,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Stack(children: [
                          Image.asset('assets/images/mobile3.png'),
                          const Padding(
                            padding: EdgeInsets.only(top: 10, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mobile Programming',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'FREE',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          )
                        ]),
                        const SizedBox(width: 15),
                        Stack(children: [
                          Image.asset('assets/images/ebisnis3.png'),
                          const Padding(
                            padding: EdgeInsets.only(top: 10, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'E-Business',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'FREE',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          )
                        ]),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 16, right: 20),
                          child: Icon(Icons.search),
                        ),
                        hintText: 'Find Courses'),
                  )),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    Text('Categories',
                        style: GoogleFonts.kumbhSans(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 37,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      decoration: BoxDecoration(
                        color: selectCategories == index
                            ? const Color.fromARGB(255, 140, 31, 236)
                            : const Color.fromARGB(255, 214, 213, 213),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text(
                        categories[index],
                        style: GoogleFonts.manrope(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: selectCategories == index
                              ? const Color.fromARGB(255, 255, 255, 255)
                              : const Color.fromARGB(255, 133, 132, 132),
                        ),
                      )),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemCount: categories.length,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Mrs_Eliza()));
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 7, bottom: 7, right: 7),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 210, 229, 244),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Row(children: [
                            AssetImageWidget(
                                imagePath: 'assets/images/uiux.png',
                                height: 110,
                                width: 110,
                                fit: BoxFit.cover),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Title
                                Text(
                                  'UI/UX Design',
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
                                  'Mrs.Eliza',
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
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ArnoDorian()));
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 7, bottom: 7, right: 7),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 210, 229, 244),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Row(children: [
                            AssetImageWidget(
                                imagePath: 'assets/images/ui.png',
                                height: 110,
                                width: 110,
                                fit: BoxFit.cover),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Title
                                Text(
                                  'User Interface',
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
                                  'Mr. Arno Dorian',
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
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MrsSofia()));
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 7, bottom: 7, right: 7),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 210, 229, 244),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Row(children: [
                            AssetImageWidget(
                                imagePath: 'assets/images/ui2.png',
                                height: 110,
                                width: 110,
                                fit: BoxFit.cover),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Title
                                Text(
                                  'UI/UX',
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
                                  'Mrs. Sofia',
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
            ],
          ),
        ),
      ),
    );
  }
}
