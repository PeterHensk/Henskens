import 'package:flutter/material.dart';
import 'sign_up.dart';
import 'update_password.dart';

class LoginForm extends StatefulWidget {
  final AnimationController animationController;

  LoginForm({required this.animationController});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isPasswordVisible = false;

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
          onChanged: (text) {
            widget.animationController.forward();
          },
          decoration: InputDecoration(labelText: 'E-mail address'),
        ),
        TextField(
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UpdatePasswordPage()));
              },
              child: Text('Forgot Password?'),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle login
                  },
                  child: Text('Login'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                    // Handle sign up
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
