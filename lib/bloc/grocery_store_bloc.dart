import 'package:flutter/material.dart';

import '../models/grocery_product.dart';

enum GroceryState { normal, details, cart }

class GroceryStoreBLoC with ChangeNotifier {
  GroceryState groceryState = GroceryState.normal;
  List<GroceryProduct> catalog = List.unmodifiable(groceryProducts);
  List<GroceryProductItem> cart = [];

  void changeToNormal() {
    groceryState = GroceryState.normal;
    notifyListeners();
  }

  void changeToCart() {
    groceryState = GroceryState.cart;
    notifyListeners();
  }

  void addProduct(GroceryProduct product, int quantity) {
    for (GroceryProductItem item in cart) {
      if (item.product.name == product.name) {
        item.add(quantity);
        notifyListeners();
        return;
      }
    }
    cart.add(GroceryProductItem(product: product, quantity: quantity));
    notifyListeners();
  }

  void deleteProduct(GroceryProductItem productItem) {
    cart.remove(productItem);
    notifyListeners();
  }

  int totalCartElements() => cart.fold(
      0, (previousValue, element) => previousValue + element.quantity);

  double totalPriceElements() => cart.fold(
      0.0,
      (previousValue, element) =>
          previousValue + (element.quantity * element.product.price));
}

class GroceryProductItem {
  int quantity;
  final GroceryProduct product;

  GroceryProductItem({this.quantity = 1, @required this.product});

  void add(int newQuantity) {
    quantity = quantity + newQuantity;
  }

  void substract() {}
}
