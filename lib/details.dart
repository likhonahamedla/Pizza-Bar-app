import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pizza_bar/asset.dart';
import 'package:pizza_bar/cartProvider.dart';
import 'package:pizza_bar/homepage.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final Map<String, String> data;
  const DetailsPage({super.key, required this.data});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int itemCount = 0;
  decrement() {
    if (itemCount > 0) {
      setState(() {
        itemCount--;
      });
    }
  }

  increment() {
    setState(() {
      itemCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView(
                children: [
                  Image.asset(
                    widget.data['img']!,
                    height: 300,
                    width: double.infinity,
                  ),
                  SizedBox(height: 14),
                  Text(
                    widget.data['rating']!,
                    style: text(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.data['name']!,
                    style: text(fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 17),
                  Text(
                    'Description',
                    style: text(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.data['description']!,
                    style: TextStyle(fontSize: 16, height: 2),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: color,
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.data['price']!,
                      style: text(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: buttonColor,
                          ),
                          child: IconButton(
                            onPressed: () {
                              decrement();
                            },
                            icon: Icon(Icons.remove, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Text(
                            itemCount.toString(),
                            textAlign: TextAlign.center,
                            style: text(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: buttonColor,
                          ),
                          child: IconButton(
                            onPressed: () {
                              increment();
                            },
                            icon: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Builder(
                  builder: (ctx) {
                    return ElevatedButton(
                      onPressed: () {
                        if (itemCount == 0) {
                          ScaffoldMessenger.of(ctx).showSnackBar(
                            SnackBar(
                              content: Text('Please add first'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        } else {
                          ctx.read<CartProvider>().addCart(
                            widget.data,
                            itemCount,
                          );
                          showDialog(
                            barrierDismissible: false,
                            context: ctx,
                            builder: (dialogContext) => AlertDialog(
                              contentPadding: EdgeInsets.all(20),
                              backgroundColor: color,
                              title: Text(
                                widget.data['name']!,
                                style: text(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              content: Text(
                                'Successfully added to cart',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              actions: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(dialogContext);
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 75,
                        ),
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Add to cart',
                        style: text(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
