import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widgets/favorate_button.dart';
import 'package:food_delivery/widgets/theme_notifier.dart';
import 'package:provider/provider.dart';

class FoodGridItem extends StatelessWidget {
  final int foodIndex;
  final List<FoodItem> filteredfood;

  const FoodGridItem(
      {super.key, required this.foodIndex, required this.filteredfood});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Container(
      decoration: BoxDecoration(
          color: themeNotifier.isDarkMode ? Colors.black26 : Colors.white,
          borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LayoutBuilder(
              builder: ((context, constraints) => Column(
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              filteredfood[foodIndex].imageUrl,
                              height: constraints.maxHeight * 0.5,
                              width: constraints.maxWidth * 0.5,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: FavorateButton(
                                foodIndex: foodIndex,
                                height: constraints.maxHeight * 0.2,
                                width: constraints.maxWidth * 0.2,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.15,
                        child: FittedBox(
                          child: Text(
                            filteredfood[foodIndex].name,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.15,
                        child: FittedBox(
                          child: Text(
                            '\$${filteredfood[foodIndex].price}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.green),
                          ),
                        ),
                      )
                    ],
                  )))),
    );
  }
}
