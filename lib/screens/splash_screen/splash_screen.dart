import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/navigation_screen/navigator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.gif(
          useImmersiveMode: true,
          gifPath: 'assets/book2.gif',
          gifWidth: 269,
          gifHeight: 474,
          nextScreen: NavigationScreen(),
          duration: const Duration(milliseconds: 3000),
          backgroundColor: Color.fromARGB(255, 230, 196, 223),
        );
  }
}