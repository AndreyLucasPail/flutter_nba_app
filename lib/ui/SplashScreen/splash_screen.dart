import 'package:flutter/material.dart';
import 'package:nba_app_flutter/ui/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const tag = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 10),
    ).then(
      (value) => navigateToHome(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: LinearProgressIndicator(),
        ),
      ),
    );
  }

  void navigateToHome() {
    Navigator.pushReplacementNamed(context, HomeScreen.tag);
  }
}
