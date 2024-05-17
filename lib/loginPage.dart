import 'package:flutter/material.dart';
import 'mailList.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _header(context),
            _inputField(context),
            _forgotPassword(context),
            _signup(context),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/logo1.png', fit: BoxFit.cover, height: 200)
      ],
    );
  }

  Widget _inputField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
              hintText: "Username",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              fillColor: Color.fromARGB(255, 103, 174, 224).withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.person)),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            fillColor: Color.fromARGB(255, 103, 174, 224).withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.password),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // Navigate to MailListPage when login button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MailListPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10), // Makes the corners rectangular
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Color.fromARGB(255, 30, 144, 225),
          ),
          child: const Text(
            "LOGIN",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text(
        "Forgot password?",
        style: TextStyle(color: Color.fromARGB(255, 74, 99, 200)),
      ),
    );
  }

  Widget _signup(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        TextButton(
            onPressed: () {
              // Navigate to signup page
              Navigator.pushNamed(context, '/signup');
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(color: Color.fromARGB(255, 74, 99, 200)),
            ))
      ],
    );
  }
}
