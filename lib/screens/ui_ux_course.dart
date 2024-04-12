import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_course/component/assets_image_widget.dart';

class MrsSofia extends StatelessWidget {
  const MrsSofia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UI/UX',
          style: GoogleFonts.kodchasan(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: const Color.fromARGB(255, 140, 31, 236),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const AssetImageWidget(
                imagePath: 'assets/images/sofia.png',
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'The UI/UX Design course is meticulously crafted to provide a comprehensive understanding of User Interface (UI) and User Experience (UX) principles, equipping participants with the necessary skills to create intuitive, visually appealing, and user-friendly digital experiences.',
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
