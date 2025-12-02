import 'package:flutter/material.dart';
import 'package:yumee/utils/warna.dart';
import 'package:yumee/screens/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor.withAlpha(50),
      body: Center(
        child: Image.asset(
          "assets/images/logoUtama.png",
          width: 400,
        ),
      ),
    );
  }
}