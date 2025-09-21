import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pizza_bar/asset.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.yellow,
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Stack(
          children: [
            Positioned(
              top: 130,
              child: Lottie.asset('asset/welcome.json', height: 400),
            ),
            Positioned(
              top: 120,
              left: 20,
              child: ShopeName(fontSize: 60, color: Colors.black),
            ),
            Positioned(
              bottom: 190,
              child: Text(
                'THE TEST OF \nITALIAN PIZZA',
                style: text(fontSize: 50, fontWeight: FontWeight.w800),
              ),
            ),
            Positioned(
              bottom: 140,
              child: Text(
                'Feel the test of the most popular Italian pizza from\n anywhere and anytime.',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 65),
                  backgroundColor: color,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Text(
                  'Get Started  ➜',
                  style: GoogleFonts.roboto(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
