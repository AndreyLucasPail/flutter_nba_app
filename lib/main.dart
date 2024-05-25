import 'package:flutter/material.dart';
import 'package:nba_app_flutter/routes/app_routes.dart';
import 'package:nba_app_flutter/ui/SplashScreen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: SplashScreen.tag,
      onGenerateRoute: AppRoutes.generateRoutes,
    );
  }
}
