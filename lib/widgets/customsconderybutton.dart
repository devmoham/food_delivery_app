import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/theme_notifier.dart';
import 'package:provider/provider.dart';

class CustomSconderyButton extends StatelessWidget {
  final double height;
  final double width;
  final IconData icon;
  final VoidCallback onTap;
  const CustomSconderyButton(
      {super.key,
      required this.height,
      required this.width,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: themeNotifier.isDarkMode ? Colors.black12 : Colors.white,
          borderRadius: BorderRadius.circular(5)),
      child: InkWell(onTap: onTap, child: Icon(icon)),
    );
  }
}
