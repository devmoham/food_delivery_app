import 'package:flutter/material.dart';
import 'package:food_delivery/pages/splash_screen.dart';
import 'package:food_delivery/widgets/theme_mode.dart';
import 'package:food_delivery/widgets/theme_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeNotifier.isDarkMode? darkTheme :lightTheme,
          title: 'Foody- Food Delivery',
          home: const SplashScreen(),
        );
      },
    );
  }
  
}
