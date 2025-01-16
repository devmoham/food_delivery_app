import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/pages/food_details.dart';

class FavoriateItemCard extends StatefulWidget {
  final FoodItem foodItem;

  const FavoriateItemCard({super.key, required this.foodItem});

  @override
  State<FavoriateItemCard> createState() => _FavoriateItemCardState();
}

class _FavoriateItemCardState extends State<FavoriateItemCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => FoodDetails(
          foodItem: widget.foodItem,
        ),
      )),
      child: Card(
        borderOnForeground: true,
        
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                widget.foodItem.imageUrl,
                height: isLandScape ? size.height * 0.2 : size.height * 0.1,
                width: 100,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.foodItem.name,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text('\$${widget.foodItem.price}',
                        style: const TextStyle(color: Colors.green)),
                  ],
                ),
              ),
              Icon(
                Icons.favorite,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
