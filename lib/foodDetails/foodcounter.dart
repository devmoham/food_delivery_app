import 'package:flutter/material.dart';

class FoodCounter extends StatefulWidget {
  const FoodCounter({super.key});

  @override
  State<FoodCounter> createState() => _FoodCounterState();
}

class _FoodCounterState extends State<FoodCounter> {
  int counter = 1;
  void increament() {
    setState(() {
      counter++;
    });
  }

  void decreament() {
    if (counter > 1) {
      setState(() {
        counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          IconButton(
              onPressed: decreament,
              icon: Icon(
                Icons.minimize_rounded,
                color: counter > 1 ? Colors.black : Colors.grey,
              )),
          Text(
            counter.toString(),
            style: TextStyle(fontSize: 18),
          ),
          IconButton(
              onPressed: increament,
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}
