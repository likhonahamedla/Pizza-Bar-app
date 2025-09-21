import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  int get cartCount => _cartItems.length;

  double get totalPrice {
    double total = 0.0;
    for (var item in _cartItems) {
      total += item['total'];
    }
    return total;
  }

  void addCart(Map<String, String> item, int itemCount) {
    // Check if the item already exists in the cart
    final existingIndex = _cartItems.indexWhere(
      (cartItem) => cartItem['name'] == item['name'],
    );

    if (existingIndex != -1) {
      // If the item exists, update its quantity and total price
      _cartItems[existingIndex]['quantity'] = itemCount;
      _cartItems[existingIndex]['total'] =
          itemCount * double.parse(item['price']!.substring(1));
    } else {
      // If the item does not exist, add it as a new item
      _cartItems.add({
        ...item,
        'quantity': itemCount,
        'total': itemCount * double.parse(item['price']!.substring(1)),
      });
    }

    notifyListeners();
  }

  void clearCart() {
    _cartItems = [];
    notifyListeners();
  }

  void removeItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
}
