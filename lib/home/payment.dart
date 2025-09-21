import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Paymentpage extends StatelessWidget {
  const Paymentpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset('asset/Delivering Pizzas.json')),
    );
  }
}
