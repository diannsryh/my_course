import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 150, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome,',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 85, 27, 124)),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            const Text(
              'Sign in to continue!',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 53, 2, 63),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: emailController,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Color.fromARGB(255, 110, 110, 110),
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1.0, color: Color.fromARGB(255, 102, 7, 128)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1.0, color: Color.fromARGB(255, 102, 7, 128)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Email',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Color.fromARGB(255, 110, 110, 110),
                  )),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: passwordController,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Color.fromARGB(255, 110, 110, 110),
              ),
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              obscureText: true,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: Icon(Icons.visibility)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1.0, color: Color.fromARGB(255, 102, 7, 128)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1.0, color: Color.fromARGB(255, 102, 7, 128)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Color.fromARGB(255, 110, 110, 110),
                  )),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color.fromARGB(255, 140, 31, 236),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/my-homepage'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 85, 27, 124)),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: AutofillHints.addressCity),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
