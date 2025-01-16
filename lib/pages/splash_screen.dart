import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/onbordingscreen.dart';
import 'package:food_delivery/widgets/theme_notifier.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  get splash => null;
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: SingleChildScrollView(
          child: Column(
            children: [
              LottieBuilder.asset(
                  'assets/Lottie/Animation - 1721566595492.json'),
               Text(
                'Welcome to foody',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: themeNotifier.isDarkMode ? Colors.white : Colors.white,),
              )
            ],
          ),
        ),
        nextScreen: OnbordingScreen(),
        splashIconSize: 400,
        backgroundColor: themeNotifier.isDarkMode ? Colors.black45 : Colors.white,
      ),
    );
  }
}
