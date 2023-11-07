import 'package:flutter/material.dart';
import "package:shopify/data/dummy_data.dart";
import 'package:shopify/screens/add_item.dart';
import 'package:shopify/widget/grocery_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return const AddItemScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
        title: const Text("Your Groceries"),
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        padding: const EdgeInsets.all(20.0),
        itemBuilder: (ctx, index) {
          return GroceryItemWidget(
            name: groceryItems[index].name,
            quantity: groceryItems[index].quantity,
            color: groceryItems[index].category.color,
          );
        },
      ),
    );
  }
}
