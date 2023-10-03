import 'package:flutter/material.dart';
import 'package:henskens/screens/login_screen.dart';

void main() {
  runApp(const GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      routes: {
        '/': (context) => LoginPage()
      },
      initialRoute: '/',
    );
  }
}