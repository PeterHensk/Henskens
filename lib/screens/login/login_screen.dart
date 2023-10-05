import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'login_form.dart';
import '../plant/lookup_plants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
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
  List<CameraDescription> cameras = [];
  late Future<void> _initializeCamerasFuture;

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Added this line
          children: [
            LoginForm(animationController: _animationController), // Existing LoginForm
            ElevatedButton( // New button
              onPressed: () {
                if (cameras.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraPage(cameras: cameras),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('No camera found on this device.'),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Move without login'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
