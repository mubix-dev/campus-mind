import 'package:campus_mind/screens/login_screen.dart';
import 'package:campus_mind/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF1E7566);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CampusMind',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: teal),
        scaffoldBackgroundColor: const Color(0xFFF4F6F2),
      ),
      home: LoginScreen()
    );
  }
}

