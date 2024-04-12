import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({super.key});

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 13),
                    child: Text(
                      'My Certificates',
                      style: GoogleFonts.kodchasan(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: const Color.fromARGB(255, 140, 31, 236),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 250),
              const Text('There is no certificate yet',
                  style: TextStyle(color: Color.fromARGB(255, 107, 107, 107)))
            ],
          ),
        ),
      ),
    );
  }
}
