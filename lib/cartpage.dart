import 'package:flutter/material.dart';
import 'package:pizza_bar/asset.dart';
import 'package:pizza_bar/data.dart';

import 'package:provider/provider.dart';

import 'cartProvider.dart';
import 'home/payment.dart';

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
          icon: Icon(Icons.arrow_back_ios_new, size: 35, color: Colors.white),
        ),
        title: Text(
          'Cart',
          style: text(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              cart.clearCart();
            },
            icon: Icon(Icons.delete, size: 35, color: Colors.white),
          ),
        ],
      ),
      backgroundColor: color,
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: cart.cartItems.length,
              itemBuilder: (context, index) {
                var item = cart.cartItems[index];
                return Card(
                  color: buttonColor,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // product image
                        Image.asset(
                          item['img']!,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),

                        SizedBox(width: 10),

                        // product details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Name + Quantity
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item['name']!,
                                    style: text(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'x${item['quantity']}',
                                    style: text(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),

                              // Price + Delete
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Price: \$${item['total'].toStringAsFixed(2)}',
                                    style: text(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      cart.removeItem(index);
                                    },
                                    icon: Icon(
                                      Icons.remove_circle,
                                      size: 32,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10);
              },
            ),
          ),
          Container(
            color: buttonColor,
            padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '\$${cart.totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Paymentpage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    padding: EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 15,
                    ),
                  ),
                  child: Text(
                    'Pay Now',
                    style: text(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
