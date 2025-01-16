import 'package:flutter/material.dart';

class PropertyItem extends StatelessWidget {
  final String PropertyName;
  final String PropertyValue;
  const PropertyItem({
    super.key,
    required this.PropertyName,
    required this.PropertyValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          PropertyName,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          PropertyValue,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
