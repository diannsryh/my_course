import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/intro(2).png'),
          SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, bottom: 20, left: 7),
                child: Image.asset('assets/images/Logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Image.asset('assets/images/Logo2.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 20, left: 7),
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/login-screen'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255)),
                  child: const Text('Login',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: AutofillHints.addressCity)),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: ElevatedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/create-account'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 85, 27, 124)),
                      child: const Text(
                        'Create Account',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: AutofillHints.addressCity),
                      ))),
            ],
          ))
        ],
      ),
    );
  }
}
