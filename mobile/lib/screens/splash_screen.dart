import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF1E7566);
    const mint = Color(0xFFA8E6A3);

    return Scaffold(
      backgroundColor: teal,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(flex: 3),
              SvgPicture.asset("assets/images/campusmind_mark_white.svg"),
              const SizedBox(height: 24),
              const Text.rich(
                TextSpan(
                  text: "Campus",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                  ),
                  children: [
                    TextSpan(
                      text: "Mind",
                      style: TextStyle(color: mint),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'AI-powered wellbeing check-in',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(flex: 3),
              const SizedBox(
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  child: LinearProgressIndicator(
                    minHeight: 3,
                    color: Colors.white,
                    backgroundColor: Colors.white24,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Checking your session…',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
