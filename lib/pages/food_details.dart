import 'package:flutter/material.dart';
import 'package:food_delivery/foodDetails/propertyitem.dart';
import 'package:food_delivery/foodDetails/topbanner.dart';
import 'package:food_delivery/models/food_item.dart';

class FoodDetails extends StatelessWidget {
  final FoodItem foodItem;

  const FoodDetails({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopBanner(
                        foodItem: foodItem,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              foodItem.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Bufflo Burger',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  PropertyItem(
                                      PropertyName: 'Size',
                                      PropertyValue: 'Medium'),
                                  VerticalDivider(
                                    indent: 0,
                                    endIndent: 0,
                                  ),
                                  PropertyItem(
                                      PropertyName: 'Calories',
                                      PropertyValue: '150 Kcal'),
                                  VerticalDivider(
                                    indent: 0,
                                    endIndent: 0,
                                  ),
                                  PropertyItem(
                                      PropertyName: 'Cooking',
                                      PropertyValue: '10-20 Min'),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            const Text(
                                'Lorem Lorem Loremm Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem'),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 7, left: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '\$${foodItem.price}',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: Colors.deepOrange),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: SizedBox(
                    height: 50,
                    child:  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Chekout',
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          )),
                    ),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
