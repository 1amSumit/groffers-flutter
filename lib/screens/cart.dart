import 'package:flutter/material.dart';
import 'package:shopify/screens/add_item.dart';
import "package:shopify/provider/grocery_data_provider.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groferItems = ref.watch(groceryItemsProvider);

    Widget content = const Center(
      child: Text("No items in the cart."),
    );

    if (groferItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: groferItems.length,
        itemBuilder: (ctx, index) {
          //for sliding the element to remove the content
          return Dismissible(
            onDismissed: (direction) {
              ref
                  .read(groceryItemsProvider.notifier)
                  .removeItemFromCart(groferItems[index]);
            },
            key: ValueKey(groferItems[index]),
            child: ListTile(
              title: Text(groferItems[index].name),
              leading: Container(
                width: 24,
                height: 24,
                color: groferItems[index].category.color,
              ),
              trailing: Text(groferItems[index].quantity.toString()),
            ),
          );
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
      ),
      body: content,
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
