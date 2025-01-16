import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widgets/customsconderybutton.dart';

class FavorateButton extends StatefulWidget {
  final int foodIndex;
  final double height;
  final double width;

  const FavorateButton({super.key, required this.foodIndex, required this.height, required this.width});

  @override
  State<FavorateButton> createState() => _FavorateButtonState();
}

class _FavorateButtonState extends State<FavorateButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomSconderyButton(
        
          height: widget.height,
          width: widget.width,
          icon: foods[widget.foodIndex].isFavorite
              ? Icons.favorite
              : Icons.favorite_border,
          onTap: () {
            setState(() {
              foods[widget.foodIndex] = foods[widget.foodIndex].copyWith(
                isFavorite: !foods[widget.foodIndex].isFavorite,
              );
            });
          }),
    );
  }
}
