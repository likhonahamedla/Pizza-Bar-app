import 'package:flutter/material.dart';
import 'package:pizza_bar/asset.dart';
import 'package:pizza_bar/data.dart';
import 'package:provider/provider.dart';

import 'cartProvider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, size: 35),
        ),
        title: Text(
          'Cart',
          style: text(fontSize: 28, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              cart.clearCart();
            },
            icon: Icon(Icons.delete, size: 35),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: cart.cartItem.length,
              itemBuilder: (context, index) {
                var item = cart.cartItem[index];
                return Card(
                  color: color,
                  child: ListTile(
                    leading: Image.asset(item['img']!),
                    title: Text(
                      item['name']!,
                      style: text(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      item['price']!,
                      style: text(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove, size: 35, color: Colors.white),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10);
              },
            ),
          ),
        ],
      ),
    );
  }
}
