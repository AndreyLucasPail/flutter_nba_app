import 'package:flutter/material.dart';
import 'package:nba_app_flutter/ui/SplashScreen/splash_screen.dart';
import 'package:nba_app_flutter/ui/home/home_screen.dart';
import 'package:nba_app_flutter/ui/player_screen/player_screen.dart';
import 'package:nba_app_flutter/ui/searchScreen/search_screen.dart';

class AppRoutes {
  static Route generateRoutes(RouteSettings settings) {
    Widget screen = getScreenNullable(settings) ?? const SplashScreen();
    return MaterialPageRoute(builder: (context) => screen, settings: settings);
  }

  static Widget? getScreenNullable(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.tag:
        return const SplashScreen();
      case HomeScreen.tag:
        return const HomeScreen();
      case PlayerScreen.tag:
        return const PlayerScreen();
      case SearchScreen.tag:
        return const SearchScreen();
      default:
        return null;
    }
  }
}
