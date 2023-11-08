import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopify/data/categories.dart';
import 'package:shopify/models/grocery_item.dart';
import 'package:shopify/screens/add_item.dart';

import "package:http/http.dart" as http;

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<GroceryItem> groferItems = [];
  bool _isLoading = true;
  String? _error;
  void getData() async {
    final url = Uri.https(
        "shopify-1715f-default-rtdb.asia-southeast1.firebasedatabase.app",
        "cart.json");

    final res = await http.get(url);

    if (res.statusCode >= 400) {
      setState(() {
        _error = "Failed to fetch the data. PLease try again later.";
      });
    }

    final Map<String, dynamic> listData = json.decode(res.body);
    final List<GroceryItem> loadItems = [];
    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere((catItme) => catItme.value.type == item.value['category'])
          .value;
      loadItems.add(
        GroceryItem(
          id: item.key,
          name: item.value["name"],
          quantity: item.value["quantity"],
          category: category,
        ),
      );
    }
    setState(() {
      groferItems = loadItems;
      _isLoading = false;
    });
  }

  void removItem(GroceryItem item) {
    final url = Uri.https(
        "shopify-1715f-default-rtdb.asia-southeast1.firebasedatabase.app",
        "cart/${item.id}.json");

    http.delete(url);

    setState(() {
      groferItems.remove(item);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text("No items in the cart."),
    );

    if (_isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_error != null) {
      content = Center(
        child: Text(_error!),
      );
    }

    if (groferItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: groferItems.length,
        itemBuilder: (ctx, index) {
          //for sliding the element to remove the content
          return Dismissible(
            onDismissed: (direction) {
              removItem(groferItems[index]);
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
        onPressed: () async {
          final newItem = await Navigator.of(context).push<GroceryItem>(
            MaterialPageRoute(
              builder: (ctx) {
                return const AddItemScreen();
              },
            ),
          );

          if (newItem == null) {
            return;
          }

          setState(() {
            groferItems.add(newItem);
          });
        },
        label: const Icon(Icons.add),
      ),
    );
  }
}
