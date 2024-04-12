import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_course/component/assets_image_widget.dart';

class InterpersonalSkills extends StatelessWidget {
  const InterpersonalSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Interpersonal Skills',
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
            children: [
              const AssetImageWidget(
                imagePath: 'assets/images/interpersonal_skills.jpeg',
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Mobile Programming is designed to provide a comprehensive understanding of mobile application development using Android and/or iOS platforms. The course combines theory and practice with an approach that emphasizes the development of practical skills.',
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
