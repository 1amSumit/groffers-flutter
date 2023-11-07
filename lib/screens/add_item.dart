import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopify/data/categories.dart';
import 'package:shopify/models/category.dart';
import 'package:shopify/models/grocery_item.dart';
import "package:shopify/provider/grocery_data_provider.dart";

class AddItemScreen extends ConsumerStatefulWidget {
  const AddItemScreen({super.key});

  @override
  ConsumerState<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends ConsumerState<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();

  String enterdName = "";
  int enterdQuantity = 1;
  var enteredCategory = categories[Categories.vegetables];

  void _saveItems() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      ref.read(groceryItemsProvider.notifier).addItemToCart(
            GroceryItem(
              id: DateTime.now().toString(),
              name: enterdName,
              quantity: enterdQuantity,
              category: enteredCategory!,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Add Item to cart"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text("Name"),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return "Must be between 1 and 50 characters.";
                  }
                  return null;
                },
                onSaved: (value) {
                  enterdName = value!;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Quantity"),
                      ),
                      keyboardType: TextInputType.number,
                      initialValue: "1",
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return "Must be valid positive number.";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        enterdQuantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                        value: enteredCategory,
                        items: [
                          for (final category in categories.entries)
                            DropdownMenuItem(
                              value: category.value,
                              child: Row(
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    color: category.value.color,
                                  ),
                                  const SizedBox(
                                    width: 6.0,
                                  ),
                                  Text(category.value.type),
                                ],
                              ),
                            )
                        ],
                        onChanged: (value) {
                          setState(() {
                            enteredCategory = value!;
                          });
                        }),
                  )
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                      },
                      child: const Text("Reset")),
                  ElevatedButton(
                    onPressed: _saveItems,
                    child: const Text("Add Item"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
