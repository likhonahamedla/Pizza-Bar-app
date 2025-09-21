import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Map<String, String>> _cartItem = [];
  List<Map<String, String>> get cartItem => _cartItem;

  void addCart(Map<String, String> product, int quantity) {
    for (int i = 0; 0 < quantity; i++) {
      _cartItem.add(product);
      notifyListeners();
    }
  }

  void removeCart(Map<String, String> product) {
    _cartItem.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cartItem.clear();
    notifyListeners();
  }

  get totalPrice {
    double total = 0;
    for (var item in _cartItem) {
      total += double.parse(item['price']!);
    }
    return total;
  }
}
