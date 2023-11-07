import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:shopify/data/dummy_data.dart";
import "package:shopify/models/grocery_item.dart";

class GroceryDataNotifier extends StateNotifier<List<GroceryItem>> {
  GroceryDataNotifier() : super([...groceryItems]);

  void addItemToCart(GroceryItem item) {
    state = [...state, item];
  }

  void removeItemFromCart(GroceryItem item) {
    state = state.where((g) => g.id != item.id).toList();
  }
}

final groceryItemsProvider =
    StateNotifierProvider<GroceryDataNotifier, List<GroceryItem>>((ref) {
  return GroceryDataNotifier();
});
