import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widgets/favorate_button.dart';

class TopBanner extends StatelessWidget {
  final FoodItem foodItem;
  const TopBanner({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.8, horizontal: 0.16),
        child: SafeArea(
          child: SizedBox(
            height: size.height * 0.4,
            width: size.width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButton(
                      color: Colors.deepOrange,
                    ),
                    FavorateButton(
                      foodIndex: 1,
                      height: size.height * 0.04,
                      width: size.width * 0.09,
                    ),
                  ],
                ),
                Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    foodItem.imageUrl,
                    height: size.height * 0.3,
                    width: size.width * 0.9,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
