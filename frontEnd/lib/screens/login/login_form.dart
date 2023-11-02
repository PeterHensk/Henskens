import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'sign_up.dart';
import 'update_password.dart';
import '../portfolio/portfolio_screen.dart';

class LoginForm extends StatefulWidget {
  final AnimationController animationController;

  const LoginForm({super.key, required this.animationController});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isPasswordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleLogin() async {
    final String email = emailController.text;
    final String password = passwordController.text;

    // Perform validation logic here.
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please enter both email and password.'),
      ));
    } else {
      const String url = 'http://192.168.0.182:8083/signin';

      final Map<String, String> data = {
        'email': email,
        'password': password,
      };

      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      final currentContext = context;
      if (response.statusCode == 200) {
        // Successful login
        // You can handle the response data as needed.
        // For example, you might want to store authentication tokens.
        Navigator.push(
          currentContext,
          MaterialPageRoute(
              builder: (currentContext) => const PortfolioScreen()),
        );
      } else if (response.statusCode == 401) {
        // Invalid credentials
        ScaffoldMessenger.of(currentContext).showSnackBar(
          SnackBar(
            content: Text('Invalid email or password.'),
          ),
        );
      } else {
        // Handle other error cases
      }
    }
  }

  void navigateToPortfolio() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PortfolioScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: widget.animationController,
          builder: (context, child) {
            return Image.asset(
              _isPasswordVisible
                  ? 'assets/images_login/bear_looking.png'
                  : 'assets/images_login/bear.png',
              width: 200,
              height: 200,
            );
          },
        ),
        TextField(
          controller: emailController,
          onChanged: (text) {
            widget.animationController.forward();
          },
          decoration: const InputDecoration(labelText: 'E-mail address'),
        ),
        TextField(
          controller: passwordController,
          obscureText: !_isPasswordVisible,
          onChanged: (text) {
            widget.animationController.forward();
          },
          decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdatePasswordPage()));
              },
              child: const Text('Forgot Password?'),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: handleLogin, // Call the handleLogin function
                  child: const Text('Login'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
