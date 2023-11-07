import 'package:flutter/material.dart';
import 'package:shopify/screens/add_item.dart';
import 'package:shopify/widget/grocery_item.dart';
import "package:shopify/provider/grocery_data_provider.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groferItems = ref.watch(groceryItemsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
      ),
      body: ListView.builder(
        itemCount: groferItems.length,
        padding: const EdgeInsets.all(20.0),
        itemBuilder: (ctx, index) {
          return GroceryItemWidget(
            name: groferItems[index].name,
            quantity: groferItems[index].quantity,
            color: groferItems[index].category.color,
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
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
        label: const Icon(Icons.add),
      ),
    );
  }
}
