import 'package:flutter/material.dart';
import 'package:my_course/certifpages/uiuxcertif.dart';

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({super.key});

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 167, 167, 167),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UiuxCertif()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(children: [
                    Ink(child: Image.asset('assets/images/uiux_certif.png')),
                  ]),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UiuxCertif()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(children: [
                    Ink(child: Image.asset('assets/images/uiux_certif.png')),
                  ]),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UiuxCertif()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(children: [
                    Ink(child: Image.asset('assets/images/uiux_certif.png')),
                  ]),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UiuxCertif()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(children: [
                    Ink(child: Image.asset('assets/images/uiux_certif.png')),
                  ]),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UiuxCertif()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(children: [
                    Ink(child: Image.asset('assets/images/uiux_certif.png')),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
