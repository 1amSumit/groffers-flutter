import 'package:flutter/material.dart';

class GroceryItemWidget extends StatelessWidget {
  const GroceryItemWidget({
    super.key,
    required this.name,
    required this.quantity,
    required this.color,
  });

  final Color color;
  final String name;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 30,
              height: 30,
              color: color,
              margin: const EdgeInsets.all(10.0),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Text(name),
          ],
        ),
        Text(quantity.toString())
      ],
    );
  }
}
