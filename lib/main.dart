
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:invoice/scr/indroscreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserPreferencesProvider()),
      ],
      child: MaterialApp(
        home: AnimatedSplashScreen(
          splash:  Image.asset("assets/neo-io-logo-vector.png"),
            duration: 3000,
            splashTransition: SplashTransition.fadeTransition,
            nextScreen: GreetingScreen(),
        ),
      ),
    ),
  );
}

class UserPreferences {
  Map<String, Map<String, bool?>> availability = {
    'Sunday': {
      'Morning': false,
      'Afternoon': false,
      'Evening': false,
    },
    'Monday': {
      'Morning': false,
      'Afternoon': false,
      'Evening': false,
    },
    'Tuesday': {
      'Morning': false,
      'Afternoon': false,
      'Evening': false,
    },
    'Wednesday': {
      'Morning': false,
      'Afternoon': false,
      'Evening': false,
    },
    'Thursday': {
      'Morning': false,
      'Afternoon': false,
      'Evening': false,
    },
    'Friday': {
      'Morning': false,
      'Afternoon': false,
      'Evening': false,
    },
    'Saturday': {
      'Morning': false,
      'Afternoon': false,
      'Evening': false,
    },
  };

  Future<void> saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    for (var day in availability.keys) {
      for (var time in availability[day]!.keys) {
        prefs.setBool('$day-$time', availability[day]![time] ?? false);
      }
    }
  }

  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    for (var day in availability.keys) {
      for (var time in availability[day]!.keys) {
        availability[day]![time] = prefs.getBool('$day-$time') ?? false;
      }
    }
  }
}

class UserPreferencesProvider with ChangeNotifier {
  UserPreferences _preferences = UserPreferences();

  UserPreferences get preferences => _preferences;

  Future<void> updatePreferences(UserPreferences newPreferences) async {
    _preferences = newPreferences;
    await _preferences.saveToPrefs();
    notifyListeners();
  }
}

//////
