import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widgets/favorite_card.dart';

class FoodItemPage extends StatelessWidget {
  const FoodItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final favoriteFood =
        foods.where((foodItem) => foodItem.isFavorite == true).toList();
    if (favoriteFood.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/icons8-favorites-512.png',
              height: size.height * 0.2,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'No Favorites Found',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            )
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favoriteFood.length,
              itemBuilder: (context, index) =>
                  FavoriateItemCard(foodItem: favoriteFood[index]),
            ),
          ),
        ],
      ),
    );
  }
}
