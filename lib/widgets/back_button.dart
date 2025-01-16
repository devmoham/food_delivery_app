import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/customsconderybutton.dart';

class BackButton extends StatelessWidget {
  final Color color;
  const BackButton({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomSconderyButton(
        height: 30,
        width: 30,
        icon: Icons.arrow_back_ios_new_rounded,
        onTap: Navigator.of(context).pop);
  }
}
