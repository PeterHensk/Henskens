import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Animation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return buildWideScreenLayout();
          } else {
            return buildMobileLayout();
          }
        },
      ),
    );
  }

  Widget buildWideScreenLayout() {
    return Row(
      children: [
        Expanded(
          child: Image.asset(
            'assets/images_login/wide_screen_login.png',
            fit: BoxFit.cover,
          ),
        ),
        Expanded(child: buildOriginalContent()),
      ],
    );
  }

  Widget buildMobileLayout() {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images_login/bear.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Opacity(
                opacity: _animationController.value,
                child: Image.asset(
                  'assets/images_login/bear_looking.png',
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: buildOriginalContent(),
        ),
      ],
    );
  }

  Widget buildOriginalContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          onChanged: (text) {
            _animationController.forward();
          },
          decoration: InputDecoration(labelText: 'User Name'),
        ),
        TextField(
          obscureText: !_isPasswordVisible,
          onChanged: (text) {
            _animationController.forward();
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
              onPressed: () {},
              child: Text('Forgot Password?'),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Login'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
