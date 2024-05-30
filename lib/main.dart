import 'package:flutter/material.dart';
import 'package:project/screens/navigation_screen/navigator.dart';
import 'package:project/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NavigationScreen(),
    );
  }
}
