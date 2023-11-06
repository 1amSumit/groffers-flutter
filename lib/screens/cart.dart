import 'package:flutter/material.dart';
import "package:shopify/data/dummy_data.dart";

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Your Groceries"),
          ),
        ),
        body: ListView.builder(
          itemCount: groceryItems.length,
          padding: const EdgeInsets.all(20.0),
          itemBuilder: (ctx, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      color: groceryItems[index].category.color,
                      margin: const EdgeInsets.all(10.0),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Text(groceryItems[index].name),
                  ],
                ),
                Text(groceryItems[index].quantity.toString())
              ],
            );
          },
        ));
  }
}
