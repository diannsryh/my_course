import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_course/component/assets_image_widget.dart';

class BiodataScreen extends StatelessWidget {
  const BiodataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: CircleAvatar(
                        radius: 100.0,
                        backgroundImage:
                            AssetImage('assets/images/Formal2.png')),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Biodata',
                    style: GoogleFonts.kodchasan(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: const Color.fromARGB(255, 140, 31, 236),
                    ),
                  ),
                ],
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Name: Ketut Dian Suryasih',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 33, 42, 47),
                      ),
                    ),
                    Text(
                      'NIM: 2215091031',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 33, 42, 47),
                      ),
                    ),
                    Text(
                      'Class: IKI',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 33, 42, 47),
                      ),
                    ),
                    Text(
                      'Study Program: Information System',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 33, 42, 47),
                      ),
                    ),
                    Text(
                      'Faculty: Engineering and Vocational',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 33, 42, 47),
                      ),
                    ),
                    Text(
                      'Semestes: 4',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 33, 42, 47),
                      ),
                    ),
                    Text(
                      'Address: Bjr. Dinas Gesing III',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 33, 42, 47),
                      ),
                    ),
                    Text(
                      'Nation: Republik Indonesia',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 33, 42, 47),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Experiences',
                      style: GoogleFonts.kodchasan(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: const Color.fromARGB(255, 140, 31, 236),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Member of HMJ Teknik Informatika Undiksha',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 33, 42, 47),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Member of UKM Persma Visi Undiksha',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 33, 42, 47),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Photoshop',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 33, 42, 47),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Corel Draw',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 33, 42, 47),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Canva',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 33, 42, 47),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ]),
              ),
              const Divider(),
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Interest',
                      style: GoogleFonts.kodchasan(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: const Color.fromARGB(255, 140, 31, 236),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              // Center(
              const Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: AssetImageWidget(
                          imagePath: 'assets/images/painting.jpeg',
                          width: 189,
                          height: 189,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: Center(
                        child: AssetImageWidget(
                          imagePath: 'assets/images/gaming.jpeg',
                          width: 189,
                          height: 189,
                          fit: BoxFit.cover,
                        ),
                      ))
                    ],
                  )),
              const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: AssetImageWidget(
                          imagePath: 'assets/images/photography.jpeg',
                          width: 189,
                          height: 189,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: Center(
                        child: AssetImageWidget(
                          imagePath: 'assets/images/music.jpeg',
                          width: 189,
                          height: 189,
                          fit: BoxFit.cover,
                        ),
                      ))
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
