import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_course/component/assets_image_widget.dart';

class ArnoDorian extends StatelessWidget {
  const ArnoDorian({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Interface',
          style: GoogleFonts.kodchasan(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: const Color.fromARGB(255, 140, 31, 236),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AssetImageWidget(
                imagePath: 'assets/images/arno.png',
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'The User Interface (UI) course is designed to equip participants with the essential knowledge and skills to create visually appealing and functional interfaces for digital products.',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Status: Enrolled',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 210, 229, 244)),
                child: const Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
