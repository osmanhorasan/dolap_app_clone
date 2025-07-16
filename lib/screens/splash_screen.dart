import 'package:dolap_app_clone/screens/auth/auth_main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    // Simulate a delay for splash screen
    Future.delayed(const Duration(seconds: 6), () {
      // Navigate to the next screen after the delay
      Navigator.pushReplacementNamed(context, "/auth/main");
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_screen.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: isLoading ? CircularProgressIndicator() : SizedBox.shrink(),
        ),
      ),
    );
  }
}
