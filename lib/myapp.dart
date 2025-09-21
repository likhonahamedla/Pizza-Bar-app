import 'package:flutter/material.dart';
import 'package:pizza_bar/homepage.dart';
import 'package:pizza_bar/welcome.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizza Bar',
      home: WelcomePage(),
      routes: {'/home': (context) => Homepage()},
    );
  }
}
